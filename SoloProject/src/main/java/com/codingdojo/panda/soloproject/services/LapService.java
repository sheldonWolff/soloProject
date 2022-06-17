package com.codingdojo.panda.soloproject.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.panda.soloproject.models.Lap;
import com.codingdojo.panda.soloproject.models.User;
import com.codingdojo.panda.soloproject.repositories.LapRepository;
@Service
public class LapService {
	@Autowired
	LapRepository lapRepo;
	
	public Lap createLap(Lap b) {
		return lapRepo.save(b);
	}
	
	public Lap findLapById(Long id) {
		Optional<Lap> optionalLap = lapRepo.findById(id);
		if(optionalLap.isPresent()) {
			return optionalLap.get();
		} else {
			return null;
		}
	}
	
	public List<Lap> allLaps(){
		return lapRepo.findAll();
	}
	
	public void deleteLap(Long id) {
		lapRepo.deleteById(id);
	}
	public List<Lap> findByTrack(String track){
		return lapRepo.findLapsDistinctByTrackOrderByTimeAsc(track);
	}
	public List <Lap>freedomPark(User user){
		List <Lap> userLaps = user.getLaps();
		ArrayList <Lap> output = new ArrayList <Lap> ();
		for(Lap i:userLaps) {
			if(i.getTrack().equals("Freedom Park")) {
				output.add(i);
			}
		}
		return output;
	};
	public List <Lap>channelIslands(User user){
		List <Lap> userLaps = user.getLaps();
		ArrayList <Lap> output = new ArrayList <Lap> ();
		for(Lap i:userLaps) {
			if(i.getTrack().equals("Channel Islands Raceway")) {
				output.add(i);
			}
		}
		return output;
	};
	public List <Lap>hotRodHobbies(User user){
		List <Lap> userLaps = user.getLaps();
		ArrayList <Lap> output = new ArrayList <Lap> ();
		for(Lap i:userLaps) {
			if(i.getTrack().equals("Hot Rod Hobbies")) {
				output.add(i);
			}
		}
		return output;
	};
}
