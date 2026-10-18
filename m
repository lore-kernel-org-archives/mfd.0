Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFD033F8B1
	for <mfd@lists.linux.dev>; Sun, 18 Oct 2026 02:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792290513; cv=none; b=Zd4qPuN25L1rg/vOHW4bRQAgqI/qtG4OMHa48SyAchvmyRWNJR+fkufk74WgTEuSD7Hlvb8VNwXTdlmeZpBegls7Ws1Oq7uPX3mXsEmL++/pbYT4wrwbt1oRo+Qz0MAbGWGQPyDZ5nsjGru31HSjBVmGKqHBmISlBG7++5Hl/tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792290513; c=relaxed/simple;
	bh=EThjoQXFKrjjDxxPZzB3qoaitWeF1CAByogIYAprBcE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=OrsRGoFRaESVu3dg+pK8L+Dg7zHobj0U5EbHh35MHPY7ri+G8k6hdOrEpam2UVS6EJp0YPowYUGzPTW22pCoFTC6SYXNjhcrKzKiVIsHFDaAvHIU7jUte+qJ4I5Xw7gRr0bEK3fHz2Xvsrc7atdwG463rnB4AKjjtvtVp7lauKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RVrfSTP5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RVrfSTP5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27DB61F000C4;
	Sun, 18 Oct 2026 02:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792290511;
	bh=9/u6sS/ZIIeltNaXvAbkfjkUjqYurJZwaGFDp6t3ga4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RVrfSTP5NA/w+EyftkZLFI1T6rr8qY8kMj9+kODLVfDCvDAJukx/lYi1Dx5Lo4HPS
	 zeoiBMsfd8K79YKNxon8jSBu6N+6Q+z5kXYg//mD8a7qPhtQnmH9ooGvnp0xFtqCRW
	 E24pB3F+srw6cldTmjz0w2PpQ3KpPxRshkJiBWyvS/uwIpbFKtZIWc+yBuGjTZemEn
	 mM2GBZsVNlM1+uDjagBuoN86zRqT4TUDYol35iMcIcncqCMzrwZoEJ6ARYs903VIPP
	 t7bX2tPHp11XRLxzXhGGNqxA65zlZsB4X+TtDDID1i7IY0TIEJcH86A7YkbNqv4o00
	 b4UeaTjcaRoTQ==
Message-ID: <sashiko-outbox-175881@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd: mxs-lradc: Pass mapped IRQs to child devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabio Estevam" <festevam@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261018022400.599028-1-festevam@gmail.com>
References: <20261018022400.599028-1-festevam@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Oct 2026 02:28:30 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The MFD resource tables store indices into the parent DT interrupts
> property. Since the MFD core is given neither an IRQ domain nor a base,
> however, it exposes those indices to child devices as though they were
> Linux IRQ numbers.
>=20
> The touchscreen interrupt is at DT index 0 on both supported SoCs.
> platform_get_irq_byname() therefore rejects its child resource with:
>=20
>  0 is an invalid IRQ number
>=20
> On current kernels it also returns -EINVAL, preventing the touchscreen
> driver from probing.
>=20
> The child drivers try to map their resource values afterwards with
> irq_of_parse_and_map(), but the touchscreen driver never reaches that
> [ ... ]
>=20
> Cc: stable@vger.kernel.org
> Fixes: a85a6c86c25b ("driver core: platform: Clarify that IRQ 0 is invali=
d")
> Closes: https://lore.kernel.org/linux-input/CAOMZO5CgTzo6GuXptD4mFTN=3DUs=
JJqpkixDW1Q64gqZGrij8+uQ@mail.gmail.com/
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261018022400.5990=
28-1-festevam@gmail.com?part=3D1

