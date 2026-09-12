Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692D538236F;
	Sat, 12 Sep 2026 22:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789253709; cv=none; b=PgVmaigrunmPpCS5tU/FSoOuHdxaQ0nQApJta741BBBZ7k723iqzRUEztKRdP19ztcablbEx6w2DEF7gZRR3Xx9dg/+vGTk9abnGf3krpRvK5VMddBSJbY5QejjYp5MxZ6aktevvMpC3xJGFWFoRR5K7JxZM81gM6C82FSMqM8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789253709; c=relaxed/simple;
	bh=+gHy30ELM66G/JR5uiOKXGv6/fNif5jTsxMk30kyNac=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Td71oIAsRJpj0cwDnnS1odOiAk/jidtKt276A3RDMElD8VqK8OFtTzyGBFgPvjKz3nZRQ9CqS1yD6gfcb4SsfxN692ODWB0K/XOHAwnK2/dpK8i4Wlp36KoVTu4wQ5wWd+3O6wbSigDCCo40nZakIY8G+c52i3xhUWePmu7+usw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=old39mrT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="old39mrT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E89911F000FF;
	Sat, 12 Sep 2026 22:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789253708;
	bh=+gHy30ELM66G/JR5uiOKXGv6/fNif5jTsxMk30kyNac=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=old39mrTCB0/qOuO2izGRcyiF+KFyX2YsGXIzZVnab5nEJBDsYRSO144kAOGckVpm
	 r1zNl0kOB3pWmoKIfXsUGzL1L+Yj8P69wb419VV1rkUb7CpYHxry5u/m5tR2yIYwzP
	 2kWaNIuWMP3CT28ODSl9bCpeB4ct2WLJ1r4ciT2nvFohEaVahKxok2xED/gbDjH6yv
	 7AwLHIkzoNMJty5BZ1uR0i7A5kIYWUtw4gJZuRNEl8+byXCE55qpkNQdUGc5gbUINQ
	 DPg/T5t1DoyKMCFs1wELBebvw36UBZS4giFB9cIgKTT/0NpetzLET9tqqemq/4FHzD
	 yFeJH+LED4d6A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v21 1/9] dt-bindings: net: dsa: Document
 support for Airoha AN8855 DSA Switch
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christian Marangi" <ansuelsmth@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260911225414.225980-2-ansuelsmth@gmail.com>
References: <20260911225414.225980-1-ansuelsmth@gmail.com>
 <20260911225414.225980-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 22:55:07 +0000
Message-Id: <20260912225507.E89911F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Document support for Airoha AN8855 5-port Gigabit Switch.
>=20
> It does expose the 5 Internal PHYs on the MDIO bus and each port
> can access the Switch register space by configuring the PHY page.
>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911225414.2259=
80-1-ansuelsmth@gmail.com?part=3D1

