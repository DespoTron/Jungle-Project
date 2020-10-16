module SalesHelper

  def active_sale?
    Sale.active.any?

    # We can query in the helper function or we can creat it in the Sales class
    # Sale.where("#sales.starts_on <= ? AND sales.ends_on >= ?", Date.current, Date.current).any?
  end

end