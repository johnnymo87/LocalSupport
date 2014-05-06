module ExhibitHelper
  def self.exhibit(user, organization, template)
    if user.nil?
      PublicUserViewingOrganization.new(user, organization, template)
    else
      RegisteredUserViewingOrganization.new(user, organization, template)
    end
  end
end

UserPresenter = UserViewingOrganization
class UserViewingOrganization
  def initialize(user, organization, template)
    @user, @organization, @template = user, organization, template
    ExhibitHelper.exhibit(user, organization, template)
  end

  def h
    @template
  end

  def edit_button; end
  def create_volunteer_op_button; end
  def claim_organization_button; end
end

class RegisteredUserViewingOrganization < UserViewingOrganization
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
  def claim_organization_button
    h.link_to(
        'This is my Organisation',
        h.new_user_session_path,
        {
            :method => put,
            :data-signed_in => false,
            :id => 'TIMO',
            :class => 'btn btn-primary'
        }
    )
  end
end