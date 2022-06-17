package com.codingdojo.panda.soloproject.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.codingdojo.panda.soloproject.models.Lap;

public interface LapRepository extends CrudRepository<Lap, Long>{
	List<Lap> findAll();
	List<Lap> findLapsDistinctByTrackOrderByTimeAsc(String track);
//	Lap findLapDistinctByTrackOrderByTimeAsc(String track);
}
