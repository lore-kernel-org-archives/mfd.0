Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48969334C1C;
	Tue, 22 Sep 2026 10:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790074134; cv=none; b=PZHb3u0buG4RfiAm300d9drAsql3yFb+bLnRSnbWt7ZxR8lwPV3Go6TgztH+Bsvg+MjzNa/5eE9+9ET7oNZhIAcv7rGov5MiTVY6Y3ulkV7tnV6X6BPJ9WcCiaeAPp+nVs5TcH+0Wh7tXoaZUEiSDebipuyHEJ219tY0RWLwjSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790074134; c=relaxed/simple;
	bh=sdoU+05LwGO/5IKHz2JWlLMFm+pfMdWGUdSvyfJT7bM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LIAo1WSEmG7lcUd9LyCg46htN4W3D9y5RFeTNAOFUngMnahi/dTKvfBjHdVIQ/IoBo8T76SkqPdDK/3BE1mAcXW+V6rCpxBie+1OUAKI7bKr3I4ya3/In35WlREQcwI7cwkv8Gm0ifiZGKcf8yo7SFOEW+iHICtslfo/J6uPMfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MOCZ7uKD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MOCZ7uKD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 740561F000FF;
	Tue, 22 Sep 2026 10:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790074133;
	bh=tlFFiZRxfgx1Jj0XoMt/FlYoTm4Jk3kOQYOucZTA4lI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MOCZ7uKD+yQJIe3pIxg++oA1F9B25OfBINPzRBIyqkfIEiJVN8XDTtVfuFpJkFiLk
	 McrhI2qEt55ZTAulGfzVDjiJigkLmd8S34dTfcygzE0jcWzbaoMA4ByStcgI0U1RM1
	 YBg2hsfNbmRWKF27PoimbHshBpSuUrExyRXajTCPK2E36ejfG9m7qsirs6PZilV8MU
	 sHNuz5on7VeVS24WqxSK0V/4IGQt8MfLv/rksztiteyTqlW+TsC6i6OF9gmXFSWiOg
	 YnM1q2CWX3Io9ncnu+NimclHyCK8Z3S1Rcg38IO9auLyF3Lj/T7c3YWXoKlBMRGeqH
	 Jrpd6sdGJQyNg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v20 1/8] i3c: master: Add APIs for I3C hub support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev, linux-i3c@lists.infradead.org, lee@kernel.org, robh@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260922103551.2754613-2-lakshay.piplani@nxp.com>
References: <20260922103551.2754613-1-lakshay.piplani@nxp.com>
 <20260922103551.2754613-2-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 10:48:52 +0000
Message-Id: <20260922104852.740561F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] i3c: missing locking documentation for exported i3c_bus_set_addr_sl=
ot_status()
--

commit 732589b2fdab035a70a02657f4550d825edf46a1
Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Subject: i3c: master: Add APIs for I3C hub support

Add CCC helpers to check CCC support and send CCC commands, address slot
helpers to query and update I3C bus address slot state, registering virtual
masters with an explicit firmware node, and exposing the bus maintenance
lock helpers.

> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 2cdbffd33fd7f..d1e8cae374b97 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
[ ... ]
> @@ -423,11 +435,18 @@ static void i3c_bus_set_addr_slot_status_mask(struc=
t i3c_bus *bus, u16 addr,
>  	*ptr |=3D ((unsigned long)status & mask) << (bitpos % BITS_PER_LONG);
>  }
> =20
> -static void i3c_bus_set_addr_slot_status(struct i3c_bus *bus, u16 addr,
> -					 enum i3c_addr_slot_status status)
> +/**
> + * i3c_bus_set_addr_slot_status() - Set I3C bus address slot status
> + * @bus: I3C bus.
> + * @addr: I3C address to update.
> + * @status: Address slot status to set.
> + */
> +void i3c_bus_set_addr_slot_status(struct i3c_bus *bus, u16 addr,
> +				  enum i3c_addr_slot_status status)

[Severity: Low]
Could the kernel-doc for this newly exported function be updated to document
the locking requirements?

Because i3c_bus_set_addr_slot_status() calls i3c_bus_set_addr_slot_status_m=
ask(),
which modifies bus->addrslots using non-atomic bitwise operations, the call=
er
needs to hold the bus->lock (for example, by calling i3c_bus_maintenance_lo=
ck())
to prevent data races. Documenting this requirement would help prevent futu=
re
consumers of this API from introducing concurrency issues.

>  {
>  	i3c_bus_set_addr_slot_status_mask(bus, addr, status, I3C_ADDR_SLOT_STAT=
US_MASK);
>  }
> +EXPORT_SYMBOL_GPL(i3c_bus_set_addr_slot_status);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922103551.2754=
613-1-lakshay.piplani@nxp.com?part=3D1
