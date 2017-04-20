package com.caveofprogramming.spring.web.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.caveofprogramming.spring.web.dao.Offer;
import com.caveofprogramming.spring.web.service.OffersService;

@Controller
public class OffersController {

	private OffersService offersService;

	@Autowired
	public void setOffersService(OffersService offersService) {
		this.offersService = offersService;
	}

	@RequestMapping("/offers")
	public String showOffers(Model model) {

		List<Offer> offers = this.offersService.getCurrent();

		model.addAttribute("name", "Francis");
		model.addAttribute("offers", offers);

		return "offers";
	}

	@RequestMapping("/createoffer")
	public String createOffer(Model model) {

		model.addAttribute("offer", new Offer());

		return "createoffer";
	}

	@RequestMapping(value = "/docreate", method = RequestMethod.POST)
	public String doCreate(Model model, @Valid Offer offer, BindingResult result) {
		// spring automaticamente acquisisce i dati
		// dalla form in createoffer
		// e crea l'oggeto offer con i
		// parametri inseriti

		if (result.hasErrors()) {

			return "createoffer";
		}

		this.offersService.create(offer);

		return "offercreated";
	}

	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String test(Model model, @RequestParam("id") String id) {
		// se id non è presente nell'url si presenta un'eccezione
		System.out.println("id is: " + id);

		return "home";
	}
}
