Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E523793B3;
	Tue,  1 Sep 2026 17:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788285490; cv=none; b=gB40ctz4eiQ7ThyVuGzhAkNlEUDoXcYiKCoiM7QHvJrPtnkkbBrDVY7Erc293z7Wud6UdF1MaC9n8f75KMX+GviJii2L9HhjP5PSP7DaaWoC2+/8H+KqbgzvAQ9XUNyQQna9TK2KCEMAMIHs3yEdM212chz3qc2TIaT90k0zgCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788285490; c=relaxed/simple;
	bh=0SBuMMaHOCEuTDb5VwH+tDfN8+fwoNrHw16h618++lE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r54ECU/uUeW1PpMd32trQNxENXQJh5lyEEc8k8ybQ+/QJfai9CMByiRr8UmOTJ/Q4lRA1WFIMr+yXedR+czjuq4LaQtme4+NijPvcg1lyfFtyCqGrh4ShTs1Dvfal+Eeaf75njn/4as1q9ow9e00ada+jzTyNVQLZOMOWnX6+nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IkCQ4u1k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IkCQ4u1k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D45531F000E9;
	Tue,  1 Sep 2026 17:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788285489;
	bh=ZKlKvWADAFzPjMEhdCxgZA7PWsY+aCvikz0gb3BdLUw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IkCQ4u1kbYoKy5G3yS7aCbcHt0uiG1XsYsnKoIkKHi36W7kT/GO4XmRxtKUdK2Yl4
	 4LPT0PVI8ziG58euMDMpOl7yZR+7AnecdMrSWSW9dJO3X17yLc1w5JzBNADOxehueF
	 UTBRj4r4gNMCxvyYxkYftEe306hfuzgJtAGhF37MD4T1jlGy9oJvpZVh6YhNCbiHJm
	 yITsa3BVosQdM98bgH76GriLx/WpKE+BOM8oXLEZidgbIwxh7rsxhruNUi9KWcsI/M
	 KO3uJzLkSfcrw4dqzI52drbzmdmTORUfrv3BmseW8mVFcUAfesbfODhObgW4Bb7p3n
	 vkL756JmL303A==
Date: Tue, 1 Sep 2026 18:58:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Stephan Gerhold <stephan@gerhold.net>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Axel Lin <axel.lin@ingics.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	devicetree@vger.kernel.org, mfd@lists.linux.dev
Subject: Re: [PATCH 08/13] dt-bindings: mfd: ab8500: Add regulators
Message-ID: <20260901-zombie-hermit-798a9851e3d8@spud>
References: <20260831-ux500-dts-snowball-regulator-v1-0-fe279fff5e18@kernel.org>
 <20260831-ux500-dts-snowball-regulator-v1-8-fe279fff5e18@kernel.org>
 <20260831-subtitle-anvil-0f33fee6c2af@spud>
 <CAD++jLnBSrzXnPdtr_NqTymqBupYv_-xW3NAMCa=7Dx1RwtAFg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o8p0ee16I/meqmxv"
Content-Disposition: inline
In-Reply-To: <CAD++jLnBSrzXnPdtr_NqTymqBupYv_-xW3NAMCa=7Dx1RwtAFg@mail.gmail.com>

--o8p0ee16I/meqmxv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 10:18:09PM +0200, Linus Walleij wrote:
> On Mon, Aug 31, 2026 at 6:18=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
>=20
>=20
> > > +            ab8500_buck_smps1:
> > > +            ab8500_buck_smps2:
> > > +            ab8500_buck_smps3:
> >
> > How do these differ from
> >   regulator-external:
> >       ab8500_ext1:
> >         description: The voltage for the VSMPS1 external regulator
> >       ab8500_ext2:
> >         description: The voltage for the VSMPS2 external regulator
> >       ab8500_ext3:
> >         description: The voltage for the VSMPS3 external regulator
>=20
> Exactly in the way they say, the former are internal, the regulators
> exist in the AB8500/AB8505 silicon. The latter are external,
> they are just control channels for regulators outside of the
> AB8500/AB8505.
>=20
> The three "external regulators" are control channels going out
> of the AB8500/AB8505 to control secondary silicon outside
> of the AB8500/AB8505.
>=20
> It is also clearly seen in the Linux driver which use different
> registers.
>=20
> The similar name "VSMPS1/2/3" is incidental.

Right, I see.

>=20
> SMPS =3D=3D Switched Mode Power Supply.
>=20
> (Customers didn't much use the external regulators. They
> usually implemeted GPIO-controlled regulators on the side
> instead.)
>=20
> If you want I can add some verbiage explaining that they are
> not the same despite the name is similar.

If you think it'll help people that actually have the device, yes.

>=20
> > > +            ab8500_buck_arm:
> >
> > realistically, all of these should have -s instead of _s.
>=20
> Can you elaborate, I have a hard time understanding that
> terse comment :D

Node-names and properties are expected to have -s instead of _s in them.
so ab8500-buck-arm etc

Although, all your existing ones have _s, so there's conflicting
feelings with my OCD. Do w/e you like, for that reason.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--o8p0ee16I/meqmxv
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapcSLAAKCRB4tDGHoIJi
0qtwAP0Y+eg2f7uPaej22EQuekuu7FzIDinvhsxqY9zKIM24XAEA9PUOr+9Dl5Hj
l8wM2fbR73uHP3L7jNT8AMVosM6pyg0=
=nh82
-----END PGP SIGNATURE-----

--o8p0ee16I/meqmxv--
