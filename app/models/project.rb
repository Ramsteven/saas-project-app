class Project < ApplicationRecord
  belongs_to :tenant
  validates_uniqueness_of :title
  validate :free_plan_can_only_have_on_project

  def free_plan_can_only_have_on_project
    if self.new_record? && (tenant.projects.count > 0) && (tenant.plan == 'free')
      errors-add(:base, "Free plans cannot have more that one project")
    end
  end

  def self.by_plan_and_tenant(tenant_id)
    tenant = Tenant.find(tenant_id)
    if tenant.plan == 'premium'
      tenant.project
    else
      tenant.projects.order(:id).limit(1)
    end
  end
end
