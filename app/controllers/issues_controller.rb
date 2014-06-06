class IssuesController < ApplicationController
  #TODO content in about and contact
  #TODO edit confirmation email
  #TODO search
  #TODO before filter on adding/editing candidates/issues


  before_filter :check_conflict_attributes, :only => 'update'

  # GET /issues
  # GET /issues.json
  def index
    flash[:alert] = "Oops! That page doesn't exist!"
    redirect_to candidates_path
    #@issues = Issue.all

    #respond_to do |format|
      #format.html # index.html.erb
      #format.json { render json: @issues }
    #end
  end

  # GET /issues/1
  # GET /issues/1.json
  def show
    @issue = Issue.find_by_id(params[:id])
    @candidate = Candidate.find_by_id(params[:candidate_id])

    if(@candidate.nil? or @issue.nil?)
      flash[:alert] = "Oops! We couldn't find that"

      if @candidate
        redirect_to candidate_path(@candidate)
        return
      else
        redirect_to candidates_path
        return
      end

    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @issue }
    end
  end

  # GET /issues/new
  # GET /issues/new.json
  def new
    #debugger
    @issue = Issue.new
    @candidate = Candidate.find_by_id(params[:candidate_id])

    if @candidate.nil?
      flash[:alert] = "Oops! We couldn't find that!"
      redirect_to candidates_path
      return
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @issue }
    end
  end

  # GET /issues/1/edit
  def edit
    @issue = Issue.find_by_id(params[:id])
    @candidate = Candidate.find_by_id(params[:candidate_id])
    if(@candidate.nil? or @issue.nil?)
      flash[:alert] = "Oops! We couldn't find that"

      if @candidate
        redirect_to candidate_path(@candidate)
        return
      else
        redirect_to candidates_path
        return
      end

    end
  end

  # POST /issues
  # POST /issues.json
  def create
    @issue = Issue.new(params[:issue])
    @candidate = Candidate.find_by_id(params[:candidate_id])
    @issue.candidate_id = @candidate.id

    respond_to do |format|
      if @issue.save
        flash[:success] = 'Issue saved!'
        format.html { redirect_to candidate_path(@candidate) }
        format.json { render json: @issue, status: :created, location: @issue }
      else
        flash[:error] = @issue.errors.full_messages
        format.html { render action: "new" }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /issues/1
  # PUT /issues/1.json
  def update
    @issue = Issue.find(params[:id])
    @candidate = Candidate.find_by_id(params[:candidate_id])

    if request.referer == conflict_candidate_issue_url
      @issue.stance = "CONFLICT"
    end

    respond_to do |format|

      if @issue.update_attributes(params[:issue])
        flash[:success] = 'Issue saved!'
        format.html { redirect_to candidate_issue_path(@candidate, @issue) }
        format.json { head :no_content }
      else
        flash[:error] = @issue.errors.full_messages
        format.html { render action: "edit" }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  def conflict
    @issue = Issue.find_by_id(params[:id])
    @candidate = Candidate.find_by_id(params[:candidate_id])

  end

  # DELETE /issues/1
  # DELETE /issues/1.json
  def destroy
    @issue = Issue.find_by_id(params[:id])

    if @issue.nil?
      flash[:notice] = "Oops! We couldn't find that"
      redirect_to candidates_path
      return
    else
      @issue.destroy
      flash[:success] = "Issue deleted!"
    end

    respond_to do |format|
      format.html { redirect_to candidates_path }
      format.json { head :no_content }
    end
  end

  private

    def check_conflict_attributes
      if request.referrer == conflict_candidate_issue_url
        issue = Issue.new(params[:issue])
        errors = 0

        if issue.conflict_title.empty?
          flash[:error] = "Conflict title can't be empty"
          errors += 1
        elsif issue.conflict_description.empty?
          flash[:error] = "Conflict description can't be empty"
          errors += 1
        elsif issue.conflict_citation.empty?
          flash[:error] = "Conflict citation can't be empty"
          errors += 1
        end

        if errors > 0
          redirect_to conflict_candidate_issue_path(params[:candidate_id,], params[:id], @issue)
        end
      end
    end

end
