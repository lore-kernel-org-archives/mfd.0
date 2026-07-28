Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CAE3C3C08
	for <mfd@lists.linux.dev>; Tue, 28 Jul 2026 18:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785262230; cv=none; b=CIEMEHyrCQvRCfAKFyUfoxqGUzDICoi7Zqx9yjxwWvZXzDORvY+wsoABPB+Ge+nAKtcJJeKLIHQgrsXNjR1pqmStWyeDti58EGEJvDm6pXznrm7YJ/cqFet+W+zrqlhGrktorsZdlgj8OTGQCgjtnnh2vo4TTm2k4DB90068uA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785262230; c=relaxed/simple;
	bh=SoZTNrUCUMJsjQyOeEB+XQ25B/C7AybQKj1Imbqx0xE=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=hds8zhuOJwDtYS9Y3IERAjjlX/Xz/gdYGQBiEqklKCO88aog8OUtHLZUyLTxkZg0mSh8qfhU4TzqcpRsd/Ha3YECwsd7SnvJkzdZyLB2M+1B2B+OQ/P0t59tAdlkUyhGiacqOFfQnkrn8pjMBvEUD3BHf2gyU9K2zwr0OTjMhfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yj2WIlh9; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yj2WIlh9"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47f3b39f2a1so169612f8f.2
        for <mfd@lists.linux.dev>; Tue, 28 Jul 2026 11:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785262227; x=1785867027; darn=lists.linux.dev;
        h=to:references:message-id:cc:date:in-reply-to:from:subject
         :mime-version:content-type:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zRqEh40r0PnAAxBC6Ehpg1QR1kIM64rXG8fPCVXya6U=;
        b=Yj2WIlh9GvD1sAbuMtDMD6NsyiFX/IQoWXXsYTOQW8algCC2sroFLsaOTKkmPVNHSq
         avPJ15pXmUUWqnXPKZkIo2Qxmp+KhZ5YztxnoIvxEHZaaVonfD73uv0xRp6w82mqqYYq
         sh3AxjCUeG/S/u5ZG/EYGaW39ybPHVRCY/2/P23IrBntMrbRK1eP5K8CqsudFljoBBPF
         /ipAjBaHyx4FDbWiLt/RTvU+RxqfLNUXpgFrOS6XF4b5vw5eSzbi/s2pqpMnJBGXXaqK
         UtE7xyoRjN2iNHuNxaGy7TDp3u5lHmA5HVtq4JC36YEHrvKG0eFSbnXU4jl4re8KyoD6
         S1ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785262227; x=1785867027;
        h=to:references:message-id:cc:date:in-reply-to:from:subject
         :mime-version:content-type:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zRqEh40r0PnAAxBC6Ehpg1QR1kIM64rXG8fPCVXya6U=;
        b=HJiu2RFTrKOqicoIzOG4ghfn3xCl8ncdgRDahYLpgB+PRojiIcNBrVmM3c9MWzARLg
         FYD3vqYpN2fhOWQuv7ThmWIEk25woipCZrVFoGSkLbxIa6rGUam4DmPQMC2hPwWlO3ze
         yyS0gcNKvmaLaxMZvj2fRrltSJZZ2SBJzI3+fnRhDZhInK6kJDldvxMynH1Q3V/vx3FM
         yCDzTaSaYJfahLw7UwAoS1x90/Lqp9DbIeBgQKoQ+C1wzgSiJNXbWjJ/G3c6gcg8n2Ir
         sPRRPPHgBQ9Dq0wAVsugj8OvtJHVepZZMlZNtOQwigT9Sdd97tRdLxEkXtFM79VgzbQp
         6Vgg==
X-Forwarded-Encrypted: i=1; AHgh+RoD55GEOeJA3KpkoXsVAvimFJNzO4eopBPBRnjzUz5QZFefAeq1X3dUdBN1BMCT5X4EVLU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwEGC2IpnKooLPPbtyaG8ooQ0BCGDOtcA4Kgot/VRpwmXWljnSg
	Dpw2s5M1YZzJFkzI9Z5VsI+u1P8gKMhVo5kDcaAIKwR3cXywiNChpkr+
X-Gm-Gg: AR+sD113Fo0MK+aQgJui6Z1aP5kZJV3aQGbw7P/LcQghVI+ulVTDN2lAKxVXTlpAfp4
	uNVIOdOI/i/9piUpLUzs+o0BY9GkcGoClILT3z+Saoz1FDa/+rsin+l10avGqGtX6+pK4A37XsZ
	RYTwW+SfzJwTgTcwvCIB8WtiLf12PiVEDzZkm5/+3Ryy2buvRnvXD/pJMWpkoj1rl0OcIa8qkFO
	B4cJ/6BhLRsXWXcfSMTJcCKe7JAHKhYVZUDE7UYhJDp7adHjl0jRPciIZQJEF75HOY0Ldx0sM8r
	rMOELy7UgvwoK190qohQf0WoPeqwl8nCdK4Jax0KDSNRnwJWEyleEszZ4yCy7vM8GhambZN2RK0
	d7gGvwJ4mfJcqU2NhyryqlAfhiX89Bij1T+DMGvX1S98KLA0jpPOFciN+cjGXF2dUf3vl6sUtxC
	UVROYlX9ZW0wjtl6LmDi5NZwsCmjD8YWg=
X-Received: by 2002:a05:6000:230e:b0:47f:9720:4740 with SMTP id ffacd0b85a97d-47fb1e9f82amr4362694f8f.37.1785262226606;
        Tue, 28 Jul 2026 11:10:26 -0700 (PDT)
Received: from smtpclient.apple ([197.250.51.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6abd0a6sm800035f8f.10.2026.07.28.11.10.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jul 2026 11:10:25 -0700 (PDT)
Content-Type: multipart/signed;
	boundary="Apple-Mail=_74B8EE53-C8E5-442D-8CD5-A08FCBF83C61";
	protocol="application/pgp-signature";
	micalg=pgp-sha256
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH v8 01/12] dt-bindings: clk: zte: Add zx297520v3 top clock
 and reset controller
From: =?utf-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
In-Reply-To: <20260728-proficient-boobook-of-will-2cc94a@quoll>
Date: Tue, 28 Jul 2026 21:10:03 +0300
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Brian Masney <bmasney@redhat.com>,
 Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Russell King <linux@armlinux.org.uk>,
 Lee Jones <lee@kernel.org>,
 linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org,
 mfd@lists.linux.dev
Message-Id: <3A3A0D17-7A80-40FE-AB89-DDE8E9A7F72B@gmail.com>
References: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
 <20260727-zx29clk-v8-1-7a107b00f1dd@gmail.com>
 <20260728-proficient-boobook-of-will-2cc94a@quoll>
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: Apple Mail (2.3864.600.51.1.1)


--Apple-Mail=_74B8EE53-C8E5-442D-8CD5-A08FCBF83C61
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Hi Krzysztof,

Thanks for the prompt review!

> Am 28.07.2026 um 09:27 schrieb Krzysztof Kozlowski <krzk@kernel.org>:
>=20
>>=20
>> +  resets:
>> +    items:
>> +      - description: USB phy reset
>> +      - description: HSIC phy reset
>> +
>> +  reset-names:
>> +    items:
>> +      - const: usb
>> +      - const: hsic
>=20
> You do not need these two. It's one device and DT does not represent
> internal device wirings because they are redundant (deducible from the
> compatible).

Just to make sure I understand the implications: Remove the PHY resets =
from the reset header (and driver) and have the PHY driver control them =
directly via regmap instead of going through its reset sibling? That way =
no self-consumption is necessary. At least that's the idea Sashiko put =
into my head with "Could the driver interact with its own registers =
directly?".

The PHY driver would take exclusive ownership of the resets anyhow, so I =
don't see anything in the way of just making it own the respective bits =
in the 0x80 register through the shared regmap.

>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - interrupts
>> +  - interrupt-names
>> +  - resets
>> +  - reset-names
>> +  - syscon-reboot
>> +  - "#clock-cells"
>> +  - "#phy-cells"
>> +  - "#reset-cells"
>> +
>> +unevaluatedProperties: false
>=20
> This was different last time and previous code was correct.

Ok, I'll keep #phy-cells and ints optional and also make it possible to =
provide only USB or HSIC ints.


--Apple-Mail=_74B8EE53-C8E5-442D-8CD5-A08FCBF83C61
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmpo8HsACgkQPRO8yFRP
GiLPTA//VT+BJ+4K6QWEatqxIi67Rfy+A3mhALsMoPStAPoN8KELPVr+JoqLoFD8
lz9s0uj1PXWN1CmBArx6Hzm1N35owUoP46VLnwqrIAR0gaor+PQPHJ9In5L6E6Lm
SdUs0QfxWMV75E2IM1tTRf8MKa6SnCvEp72OAYdMgRzEd7f0vp9fV9716yb0Ej7q
ZXG85U4f/1++S5XHoPxqFxrxunsJoX4GgVEmKyeB9N3spWjS7KykKo2UYFZEctFg
RUiai7lO1I2X9DuFGkuVZcouCIcpB1eJHx7r3UOTwIG6kbTKHBjWoq32L2tjUY4B
nSkU7vMfwUA387n/zdeisN6smcf0C8uH3g8PSozuzaojYQzAr5MjbmgDue2R1LQi
wVfHBdREUJL1WHt25UgiE5EcBcrQhwxccqDuWbkXH9toxP0HUEpTn9gdB8yNdGQx
HSLsQCaqOew5/9nPEnwn0X7q7FnnBSOYv6AQ5g96xPeuNDNQ2n8f80X8iBmy3qup
tWM+cCViEhEkoLl0x+/XTO6vfljHztZCpv2Xey9PGs7HDtyJbBMTkcHdcCTFV9yo
RKzQMdJgqmIfycOlUGL+eHCI1X9SGEZc7hcENPBn666TnnWf3XrsCKZNHFBCU85e
HUylGFuzN2pdc1MzYxgwFIJhKLtsVV8pLrnR3WfCD/2F6XYb36g=
=Oh+I
-----END PGP SIGNATURE-----

--Apple-Mail=_74B8EE53-C8E5-442D-8CD5-A08FCBF83C61--
