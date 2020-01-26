require 'base64'

class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authentication_required!
  layout 'admin-app'
  
  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.order(:order)
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def delete_image
    pp params

    Image.delete(params['id'])

    redirect_to action: "show", id: params['project_id']
  end

  def delete_main_image
    pp params

    project = Project.find_by_id(params['project_id'])

    if (project) 
      project.main_img = nil
      project.main_img_cont_type = nil
      project.main_img_base64 = nil
      project.save
    end

    redirect_to action: "show", id: params['project_id']
  end

  def add_main_image
    file = params['file']
    project = Project.find_by_id(params['project_id'])

    if project && file
      project.main_img = file.original_filename
      project.main_img_cont_type = file.content_type
      project.main_img_base64 = Base64.encode64(file.read)
      project.save
      project.store_to_public
    else 
      flash[:notice] = "Please select file to upload."
    end

    redirect_to action: "show", id: params['project_id']
  end

  def add_image
    file = params['file']
    project = Project.find_by_id(params['project_id'])

    if project && file
      image = Image.create(title: file.original_filename, content_type: file.content_type, base64: Base64.encode64(file.read))
      project.images << image
      project.save
      image.store_to_public
      redirect_to action: "show", id: params['project_id'], :anchor => 'add_image_block'
    else 
      flash[:notice] = "Please select file to upload."
      redirect_to action: "show", id: params['project_id']
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title, :description, :author, :place, :realization, :investor, :order, :coworker, :custom1, :custom2, :custom3, :custom4)
    end
end
