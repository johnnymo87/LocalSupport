module ExhibitHelper
  def self.exhibit(user, organization, context)
    if user.nil?
      PublicUserViewingOrganization.new(user, organization, context)
    else
      RegisteredUserViewingOrganization.new(user, organization, context)
    end
  end
end

class UserViewingOrganization
  
end

class RegisteredUserViewingOrganization < UserViewingOrganization
  def initialize(user, organization, template)
    @user = user || NullUser.new
    @organization, @template = organization, template
  end

  def h
    @template
  end

  def edit_button
    h.link_to_if(
        @user.can_edit?(@organization),
        'Edit',
        h.edit_organization_path(@organization.id),
        {class: 'btn btn-primary'}
    )
  end

  def create_volunteer_op_button
    h.link_to_if(
        @user.belongs_to?(@organization),
        'Create a Volunteer Opportunity',
        h.new_volunteer_op_path,
        {class: 'btn btn-primary'}
    )
  end

  def claim_organization_button
    h.link_to_if(
        @user.can_request_org_admin?(@organization),
        'This is my Organization',
        h.user_report_path(organization_id: @organization.id, id: @user.id),
        {method: :put, class: 'btn btn-primary'}
    )
  end

end

class PublicUserViewingOrganization < UserPresenter
  def edit_button;
  end

  def create_volunteer_op_button;
  end

  def claim_organization_button
    h.link_to(
        'This is my Organisation',
        new_user_session_path,
        {
            :method => put,
            :data-signed_in => false,
            :id => 'TIMO',
            :class => 'btn btn-primary'
        }
    )
  end
end
#  <% if @editable %>
#      <%= link_to("Edit", edit_organization_path(@organization.id), {:class => 'btn btn-primary'}) %>
#  <% end %>
#  <% if @can_create_volunteer_op %>
#      <%= link_to("Create a Volunteer Opportunity", new_volunteer_op_path, {:class => 'btn btn-primary'}) %>
#  <% end %>
#  <% if current_user %>
#      <%= link_to "This is my organization", user_report_path(organization_id: @organization.id, id: current_user.id), {method: :put, class: 'btn btn-primary'} if @grabbable %>
#  <% else %>
#      <%= link_to "This is my organization", new_user_session_path, {method: :put, 'data-signed_in' => current_user.present?, id: 'TIMO', class: 'btn btn-primary'} if @grabbable %>
#  <% end %>
