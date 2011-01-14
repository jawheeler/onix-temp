# coding: utf-8

module ONIX
  module Lists
    # code list 54
    AVAILABILITY_STATUS_CODE = {
      "AB" => "Cancelled",
      "AD" => "Available direct from publisher only",
      "CS" => "Availability uncertain",
      "EX" => "No longer stocked by us",
      "IP" => "Available",
      "MD" => "Manufactured on demand",
      "NP" => "Not yet published",
      "NY" => "Newly catalogued, not yet in stock",
      "OF" => "Other format available",
      "OI" => "Out of stock indefinitely",
      "OP" => "Out of print",
      "OR" => "Replaced by new edition",
      "PP" => "Publication postponed indefinitely",
      "RF" => "Refer to another supplier",
      "RM" => "Remaindered",
      "RP" => "Reprinting",
      "RU" => "Reprinting",
      "TO" => "Special order",
      "TP" => "Temporarily out of stock because publisher cannot supply",
      "TU" => "Temporarily unavailable",
      "UR" => "Unavailable, awaiting reissue",
      "WR" => "Will be remaindered as of (date)",
      "WS" => "Withdrawn from sale"
    }
  end
end
