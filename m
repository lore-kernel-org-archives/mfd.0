Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDE342BC5E
	for <mfd@lists.linux.dev>; Mon,  3 Aug 2026 18:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785780221; cv=pass; b=DCMGMVRrTa30oSz81Hkt8d5P7gcGmZyspT1ANOt43n3ZDcdrE4PPZgX/DUJxNfSZgd/drwrExAwUa0rQmp2uLeurD0ryJ05t/Y/obIwv2Puj/4BKViE8tbuh/zxuLLkpdRHoRtalDNrJowq09bvkuhmUPVu365bXBFFwgSDxBOU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785780221; c=relaxed/simple;
	bh=ACfuI3AX9kRQ1+CBBBf5za/2rVC3FsYXI8omco7jK4w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a/K16t8cykR6VXhIhckYQIrxiqNyvPvKjltdyYivEkp6gBcR9KqWtcCbpJ9b+22bFaEmEq338AtY+S5uzDq23Rt80U/x3TzOrrAGXhST6Et2Na3zLVrGpC0Eg33nzkM/zfFo+QEaL7Eh17u12B6Lq5di+jX1Duz79P+QsbzjGoc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VCp/Bzwl; arc=pass smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VCp/Bzwl"
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-73b909fbb6bso2642466137.2
        for <mfd@lists.linux.dev>; Mon, 03 Aug 2026 11:03:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785780218; cv=none;
        d=google.com; s=arc-20260327;
        b=QAhWtwCaO290oukAcmRZLsTZVWcGggbE7AqhBrQuS1amI3QpWx7Hi6vU/Q9rlzlUZn
         DBI1lvwKYusqPTOV/EXv1j2TNCvtNHdMwGUc7e8ngPe2RLrsW32NEYBT8wjXMMYflhzQ
         wX15cBU6h+8DJsoDQAjTcBzJafVfm+AURsakXqe64CWM/0LSfuDTUvk20ZlEqrwVnpBW
         TjynBWqHsGc1aThofLjJo/PoGO1EK07Z30CyUd8Ott9qEshmFcUq8VLW4KRuv8w6j7Ib
         VSXbPpPlzXrVT3kZ3RE7mePMVQTvL3K/AX8ICLh2D1WFHKOiUvfUFxDGRxDZv8ZJ4Yhl
         7k2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2r8t0fZLO1G1B7jNQrzEMX2EdERqWbCFEmueS3AzIlQ=;
        fh=WkDTp6ji7o3JvHCK/mF4njXAoPnKsFsgXWI8KIAVEqU=;
        b=hkN4ethNbpGaMUWc8ve3U854ftqo5NCgfKbag2pvk9kig9EO5SmDc2SBCftOeWqcCq
         QaRkZMc6YDtPlo/Y6HjrSYzBcjqFR3VLY0qUQVxboKygzIV9zdZyVVOoW1OWRAf4VzIp
         tprs4uoAlxreUzHYYogcnRzh6+x3OuoVRXGeiRgcqv3gZo4R3jlp037zKhr06yZjEe8F
         IJRERfQ3K0oC1YtaYGBapsXVdJ07N1jjQTKAVaVHIJYuA4Uud4/aTt14I4tf/Bsifrn5
         UWesFXFJavT1iYDpYM2tLEpnw1vAVr94s5Cb9Ys79A/XecAFJxavSY8kklELNbhECdGC
         gLcQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785780218; x=1786385018; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2r8t0fZLO1G1B7jNQrzEMX2EdERqWbCFEmueS3AzIlQ=;
        b=VCp/BzwlGln4VGDvZpnsQSPp9/OiY9dy5zhxeVjUtPSfOF9+fGXnUYaenCGyEXf8Wq
         XArLCoFO6vl0R8xT7BQYbiON5GPFI3UjkgcJ3xOaXNCEbWclv6CWgeOugkfERO9ffeF0
         9rtVGrTOHb9OjJVbQxy5A3BNdbQ17FHq6gtaMEFiaW9gRbo4iHDmTmz5j+PsLi6p/cy1
         e3beH56Q3yOEbZACBYUha/B1bgCQrsJWDwjqaYmxs9EiaXUIJWyOHm0cfoc6PxPFRgwv
         L6XaJedGbrx0okJNRqOT0lMNqSGTQMgZHOm5LvKi/50hfe96xFIzXRxeppMPSX0lU6Ji
         L0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785780218; x=1786385018;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2r8t0fZLO1G1B7jNQrzEMX2EdERqWbCFEmueS3AzIlQ=;
        b=aflPqHLD0S9nS9cwzf1aQTwZ9WLQaxf6qbeRqwUoQCIWfBIbsjjKmaB6KyCEprcVHY
         LU3EIJ5saImIjfVzhtvEv+DyDInsTKHmQqeETCgApeofXXL2s2C4aa48yUYW7u8+qtqT
         bgpkfC5bc37+dUk29I8CdNkqJ1SrVZnDLQN+7gGEW57j1o06Qlt0qh+/+ngZIWy6BIRx
         8KSWkmtywnpo6MfxkQaGxBg5rjnNroks4165spg7dKzAxx3Sn9C0PCnb1euzQneREhHI
         zJThbQTnVWiTtTXsuf3jbBJCo9/ngAyfOCCR7LU1n0UNNN9u1+3/OhgD5tC+bO18Oavy
         iH3Q==
X-Forwarded-Encrypted: i=1; AHgh+RrpPALhuJI17iSWWPpDuOhKAAHCVjQT/H0ocIPtWXJlECXZ2acTWABivY1Tq1gF5KHN7cI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyDi3WySwm/DQiIdBHLBMMW5GL1hgJS6hpfTNYXF3gmL5YA6e6Y
	E6TiRXfNlWmBO87pLz85Lr8oJwUlgTs3zP0VX122oIdcSb25fGnHsKxLfMQrJ0pIvHJXgpMTL/c
	So+DQfcvbwRaB8sq8Jd/iuxCpwDTuisc=
X-Gm-Gg: AR+sD13QnoVDIFucIKlT0/2vaFXj2DVypZ+qa3w2S5XQr7NoPRbFbCqLhGoG5+f5Olr
	9KxTgsqk0nCHuopGgSb03z3TP3oW6r+kMjfyN8vezi8Nex/dCnlFX1B5vQQLvA7rLMcLRNVVI50
	TScKMtxfF5hdqIIwFlOK8QFO2ORIMOFTLRahN6090KbxYP71m/+EXL2vdyjWAPeDoi0VsfAF3XK
	ZjOY+hEn6OqEySMzTVddQat2whkcH745Mn7wy7uayNlpMSlD/n+DiQMkSmrmAXbrs9olRUC09z7
	tV75SASQYt1qWPFKyvxN/bRtqQ5et7HhT6iVt7/9WCHcWYgo/0swRqMiqYyQRjJwzlxiLsqQizz
	UM+onzD5GoTppmkNVpogEM/sftQ/6vwqlBj2bGFqPWwGDIXvNVhBgGHqzx+PvVoctfSiQQq2NMD
	5nUt6CcTaG7JF3/nGUZCF1sKYfZOCyFfPh/yCWiIEImO9xGDSb
X-Received: by 2002:a05:6102:6899:b0:726:8813:2085 with SMTP id
 ada2fe7eead31-75b23d6e2d3mr8230898137.13.1785780218392; Mon, 03 Aug 2026
 11:03:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260802-submit-acx00-of-dynamic-v1-v1-0-0a53cd9e21cc@gmail.com>
 <20260802-submit-acx00-of-dynamic-v1-v1-7-0a53cd9e21cc@gmail.com> <2979768f-4f83-4f28-ace3-826f4b4c6844@lunn.ch>
In-Reply-To: <2979768f-4f83-4f28-ace3-826f4b4c6844@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 3 Aug 2026 12:03:27 -0600
X-Gm-Features: AUfX_mybO2gp37G6C7TCuAPmk0gNUYqtWf9KEEokxzjK6lix8AMcIQeuj4MOO0w
Message-ID: <CADvTj4prV688JDR-QAuNd+jTVFyE9aicRaciqq0M6sB0V2GiXQ@mail.gmail.com>
Subject: Re: [PATCH 07/21] dt-bindings: net: x-powers: add AC200 EPHY control
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, 
	Richard Genoud <richard.genoud@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Saravana Kannan <saravanak@kernel.org>, Lee Jones <lee@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	mfd@lists.linux.dev, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 7:40=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > +  phy-mode:
> > +    enum:
> > +      - mii
> > +      - rmii
>
> Despite the phy- bit, phy-mode is a MAC property, it defines the MII
> the MAC uses. I would not expect to see this anywhere else.
>
> The PHY driver is told what MII to use, phydev->interface, which takes
> the values PHY_INTERFACE_MODE_RMII, PHY_INTERFACE_MODE_MII etc.
>
> Please explain why you need this here, why is the MAC nodes phy-mode
> property not sufficient.

I have reworked this for v2. The phy-mode properties will be removed from
both control bindings and their DT nodes, leaving the MAC node as the sole
source of the interface mode. The PHY driver instead passes
phydev->interface to the selected control provider.

There is one ordering complication: the control block must be powered befor=
e
the Clause 22 PHY identification registers become accessible, which happens
before a MAC has attached. Early discovery therefore uses the hardware's
reset-default MII mode.

For v2, I split the provider interface into separate power_on() and
set_interface() operations. Once the MAC has supplied phydev->interface, th=
e
PHY reset path calls set_interface(). If the provider is already powered,
this changes only the RMII_SEL bit; the normal phylib soft reset then
completes the handoff. It does not repeat the full control-block power and
reset sequence.

>
>     Andrew
