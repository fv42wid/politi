class CandidatesController < ApplicationController
  # GET /candidates
  # GET /candidates.json

  before_filter :check_user_logged_in, :only => [:new, :create, :edit, :update, :destroy]

  def index
    @candidates = Candidate.search(params[:search]).paginate page: params[:page], order: 'updated_at', per_page: 10

    #respond_to do |format|
      #format.html # index.html.erb
      #format.json { render json: @candidates }
    #end
  end

  # GET /candidates/1
  # GET /candidates/1.json
  def show
    @candidate = Candidate.find_by_id(params[:id])

    if @candidate

    else
      flash[:error] = "Could not find that candidate"
      redirect_to candidates_path
      return
    end

    if @candidate.image_url.nil?
      @candidate.image_url = 'anonymous.png'
    end
    @for_issues = Issue.find_all_by_candidate_id_and_stance(@candidate, "SUPPORTS")
    @against_issues = Issue.find_all_by_candidate_id_and_stance(@candidate, "AGAINST")
    @conflict_issues = Issue.find_all_by_candidate_id_and_stance(@candidate, "CONFLICT")

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @candidate }
    end
  end

  # GET /candidates/new
  # GET /candidates/new.json
  def new
    @candidate = Candidate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @candidate }
    end
  end

  # GET /candidates/1/edit
  def edit
    @candidate = Candidate.find(params[:id])
  end

  # POST /candidates
  # POST /candidates.json
  def create
    @candidate = Candidate.new(params[:candidate])

    respond_to do |format|
      if @candidate.save
        flash[:success] = "#{@candidate.name} was successfully created"
        format.html { redirect_to @candidate }
        format.json { render json: @candidate, status: :created, location: @candidate }
      else
        flash[:error] = @candidate.errors.full_messages
        format.html { render action: "new" }
        format.json { render json: @candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /candidates/1
  # PUT /candidates/1.json
  def update
    @candidate = Candidate.find(params[:id])

    respond_to do |format|
      if @candidate.update_attributes(params[:candidate])
        format.html { redirect_to @candidate, notice: 'Candidate was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /candidates/1
  # DELETE /candidates/1.json
  def destroy
    @candidate = Candidate.find(params[:id])
    @candidate.destroy

    respond_to do |format|
      format.html { redirect_to candidates_url }
      format.json { head :no_content }
    end
  end

  private

    def check_user_logged_in
      if user_signed_in?

      else
        flash[:alert] = "You have to sign in to do that!"
        redirect_to candidates_path
      end
    end


end
