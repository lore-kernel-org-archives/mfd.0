Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429B12D97B7
	for <mfd@lists.linux.dev>; Thu, 17 Sep 2026 18:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789669737; cv=none; b=XGGbMwSXzA9p4KdgeTtcjt/lpvNlksg0R9AWxLEqeXouPMTn9LsBo1VwMu8jneae0v2K/Zjyb+tV8N2YQbaGJepcluMILM7yTWa2bX1eop2/REThIJUNYjUC2w1YFmDEsypDqxOrkOgaO/UtxfTM+QDmAOdTB9zZJ78IrLQRBtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789669737; c=relaxed/simple;
	bh=2SpGKqTp/JfwTgeFMmRyNuW7aoTJomcaZ2jk3HniGKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qLTbiUELtrSpPwBAWJHtkb36nn8Ix5p9aXi1m4NpUmFpeeJlOsLRJDskz+5OlgJjIWmK+xv4RJBBI/W37o3wSzrzNzfgdYbmy1fhirghCZB5T5XjXTuoQF9hh7h2pbBIjXzYlGJX6Rz2FdgnwwDlDZ3HwZeyx8zJU0bMC3V95HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IkjiXdHL; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IkjiXdHL"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485b1d2874fso435341f8f.0
        for <mfd@lists.linux.dev>; Thu, 17 Sep 2026 11:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789669733; x=1790274533; darn=lists.linux.dev;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z8WFLPr3Z4Vj59hqf3BiQcKfbTnQOlSm6y7UQuAGxu8=;
        b=IkjiXdHLWSO98eI6dgid7nro1dQnNsL2d3bzWr98n2a6LzRduAQwipMi/we2cpIMyl
         8vrpk5Tyk2C8wiyos2h2c+4Cq/cJW67M/yiXkVlnO/wsN6KBYMJqB9QWjpnDn4BEtW9G
         n7KMBS7oRdEKPqZWb5RskTw3pXjnm476AA5jlRIZLIvQDHe32k7lYyJwsqyQhiIR2cSf
         5lGynKnU4VbuKQCtgTnGU7IWYRlkHUBq5ASEU6zFlIY908SQIEEWDqP67Fb5hgwFq487
         Z6d4FrQNorVqnDp/fAig4hmXMQq0tcyqR/dz0ik3PyqjZNk9KYmvMRAHCkGzt+evwIeK
         l1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789669733; x=1790274533;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z8WFLPr3Z4Vj59hqf3BiQcKfbTnQOlSm6y7UQuAGxu8=;
        b=pXKP+v9blrqBjQlDR054PFvVl3tfBAS9hS3gWbT+VGavaUFYOZrijJKjOAphoi+pe0
         lweevcJokZMmD9v3iBPl7n6+VXokCFkRkbdWvbCltnH2+idwa9o6R1bhmQH6cRXyvwpO
         nblSqUC1TZ+7eYoXi9VtssN289B9ReE3cCByyaCY0OsYbHzPGO21B6B7rB8i/zj5L/LG
         8Pn0SJoBi64nwY435TEPwna9mZrn+DfjjOP9ivQULDHi6cZUVMZFRe7jMF9eO37rEaRF
         X8KF9c1pwHjvRQx3/atf5WP7Ue6Ngjm/VdDAzU/xr3p202eRtCx4XwG+2SizNnevnAEW
         Jr8g==
X-Forwarded-Encrypted: i=1; AKwUvBzKdD/1aGKRYvm0am/ZtlvBAgj6SCDSKf2dXCVDBh6xlsEgHbckAS4qPNzjwIg0xREqD7c=@lists.linux.dev
X-Gm-Message-State: AFuF++kkhuf/kCXsVC1iSCHqfac0DLsOMotFWi2DRT82W/g9G2bYkXE4
	wmgmDHnB5pmfGaOZNcRtjydSP1jM7m8JIO82odWrfj3hBlDZ1X8A7maL
X-Gm-Gg: AYBFou1dI4rvduSv/KnPDTTblqiukvVVAwLXMOGPgd8qoYUkoGUXt6fMPiqMqAnZdLQ
	9Rvlyxj+TI3Jsix4Zfe7ZjzXE0dgRn3rPMyYJ7EliLJ32LGOZdWBqvaONpAoD6KP5SFY0ofwvVZ
	nWEhdelS/9IcmpS/y49gWsC7ZGMW00uEj/4EWemXyk691rdSIpUsgiSz2K2XU2/SJx4Izz7wGjT
	z+Nj+UkBlpbKuKAZxpQZDIXx1Ty3lOBSvR15ZF3gcth/h+Aq4wXHfAjHT6aOqDbbTqe8xpUzNJ0
	JjgebvcdzLWs2Nd913u5PLzTESiimQBPDjEJRD9UDEqoFKQdWob0WyBx4Ep8M5rdZ52sfZN0k31
	OrW4Yoa3o3Bt1EptHrG0+xOIkGiCxeowbvoNF4pSQRr407bkAp6fmeAXGSZprNHfkbEpaZbZvop
	ZBLv41KwgeR3F69hiR9VUN5MfT5FOdJslF1JMWEoEyeDkBtpz0RgsB/5EV0O5jg+h66NOBBkwqx
	Vtkgw==
X-Received: by 2002:a05:6000:708:b0:487:11:d053 with SMTP id ffacd0b85a97d-4871d915c41mr24943f8f.0.1789669733272;
        Thu, 17 Sep 2026 11:28:53 -0700 (PDT)
Received: from strix.localnet ([197.250.51.38])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf26c8dsm17422129f8f.14.2026.09.17.11.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 11:28:52 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Brian Masney <bmasney@redhat.com>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Russell King <linux@armlinux.org.uk>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 mfd@lists.linux.dev
Subject:
 Re: [PATCH v11 05/12] mfd: zx297520v3: Add a clock and reset MFD driver
Date: Thu, 17 Sep 2026 21:28:36 +0300
Message-ID: <lIjduhk6Sb-yyUCQAY-CKQ@gmail.com>
In-Reply-To: <x9tzyTnKRAOyrdtSGnka0g@gmail.com>
References:
 <20260826-zx29clk-v11-0-f8ad59c6426c@gmail.com>
 <20260910161711.GK1051768@google.com> <x9tzyTnKRAOyrdtSGnka0g@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartElaGoEJaRnaci40IYCPnGA";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPartElaGoEJaRnaci40IYCPnGA
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Lee Jones <lee@kernel.org>
Date: Thu, 17 Sep 2026 21:28:36 +0300
Message-ID: <lIjduhk6Sb-yyUCQAY-CKQ@gmail.com>
In-Reply-To: <x9tzyTnKRAOyrdtSGnka0g@gmail.com>
MIME-Version: 1.0

Hi Lee,

Am Donnerstag, 10. September 2026, 22:14:54 Ostafrikanische Zeit schrieben 
Sie:
> Hi Lee,
> 
> Thanks again for your review!

This is a ping regarding my reply[0] to your review from last week. Do you 
have any comments on my responses?

Thanks,
Stefan

0: https://lore.kernel.org/linux-arm-kernel/x9tzyTnKRAOyrdtSGnka0g@gmail.com/

--nextPartElaGoEJaRnaci40IYCPnGA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmqsMVQbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoiw48P/3we1ILZFxaaGd9dUpM9
EPNR5ZVYal8qGKGBQRRFG5L5iI9qCAETVZTl5UuYFjjcs3U9+f2t8HbH5pd6hZSt
C2F3WDGrsGddEGAPArMF7962KRKHHPUDoEOokUhrdp0/J7XFAZRDjCPJJdZxTHZD
cpnqNPNwoTUAWYs4kLINKy7fY7PW+sJqUmAqvnB47RLoFURA9/DYcNxa/1esTScd
Vyzm0NEsRFuZVSYTSjbBffTn266IrxNRSBnCJOxRAEv4edO2dkkqy9OZBDQLkcYn
LJDrdJY/bAPJFapkXGuowmd5kVtYjG60V8+0suU1m+2HLlSipyfl4XeYHAS8gT5x
UbXlsxgwtxCnMHWed3RbtXUGsYuBCsuO2HRz0Rv6Cduc2qY4XeEtgFxShiQbtq4w
bxxE8DTlxoYjflISxEYYp/fD79irBB3hsp7oeSzP8PUyHsuFfCKpb2kfwnUtwRIQ
Ov2oPm29JViaAFvrF1h5FQEU2zLsdNBquOIlsqamK07yjEPcELwlAByNv9e65/Zn
3HUXepbTgovCaAofjQsggxDdSLLb4O5FjNn26DgHxz9d6ONWOjyqOIalTG2SbujQ
ZDmnp3aIX6ETZBue8mBr5Df9zQTmCwYmmAh4PtqvOfy8R72pr+i3SSUdTXIj8h4X
3h6c3+ubcO2oiEqVFEPbus5o
=NhYp
-----END PGP SIGNATURE-----

--nextPartElaGoEJaRnaci40IYCPnGA--



