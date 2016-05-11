package gapp.model.dao;

import java.util.List;

import gapp.model.Terms;

public interface TermsDao {
  List<Terms> getTerms();
  Terms getTerm(Integer id);
}
