Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795716556;
	b=lkVwFWRbG5i6LGatRMVO3ejPVpTlBru5u/DewqEn/6Td9+lBqRgVf1T+3PDoglbtKogA
	 9xpXxky9n2gNmELs2A086MrmwGr6s3TZ5DEuCdTlP96OjNIwIBpPxGTkvQZ+Mbu0W48ON
	 xUTgNpkt+/ayWS1qaFuzF4N8g2G0lC+cUpauvBjNv8DcTAkmi0AvZfE4BQNoAW+VToN/h
	 9/JGW6whb2EL3bnYeAXqhr1GapaS67O7TgZ/qcWhHYxQvstaRS4+ucvVUzfyFaQM3kG10
	 R4ih5S9CUFu+4mXYVmtogOgWsu1JM3meq6UutVMaT7aQ+uPIzO8Mk1TnKZIxsnk1ypw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795716556;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	bh=5Ua8eli/eeePNuHrLso0Ijy+DWauR2C0WdOXLlgWKW4=;
	b=kQCRo3CPkcbonxiunkSWw8jtG4ZrhHdJWEmjw854PqI9+rVjZ+8117xOgPPlMLcgHpF6
	 +yYseN/WFPjkxs3Q6ZLz5L18OGFWixGg/pBwuc0m/tvmlmulRfyIEoSFivEj395ZHmHwR
	 rtzbgcRSxxlXL6XPmThpKM/S18dgcvu9eoma2RRZeSkbMkFJtaKvLLuQ29XZ7bxh8g83e
	 l+g6L+f/LQn99XVGD7iYNHPoDKOcZzJkZUDB2U+1HG9rj6V7IqTCUXPgEbkr2fstt52+M
	 uATIvEGPH6nHL79xuiJn0Y2w61EjhmoXcc54qq5wSLQHrcWekFwABi79kYjIWDTkD8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J66y8jSR;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F0F606A323
	for <mfd@lists.linux.dev>; Thu, 26 Nov 2026 18:09:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4F0F606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J66y8jSR
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-492f0a1b685so5163839f8f.0
        for <mfd@lists.linux.dev>; Thu, 26 Nov 2026 10:09:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716554; x=1796321354; darn=lists.linux.dev;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Ua8eli/eeePNuHrLso0Ijy+DWauR2C0WdOXLlgWKW4=;
        b=J66y8jSRKvDi8Zc2BFQXPtSVk+3tq6Doz1gk2Q+sp9RqhtKaJqkkcEtD3h7VULVeVW
         8cmFWlCjil7B7Rf3ejfJklCnOwjOZ0FXnF3qJP24kPqZeXQ0C/C3P1oEnpEGpO3hXtl8
         6omYGKSANS9zqozcJ7jyyhrUIA1q4Mioi75HVpbicmjB0xLXXrcAhjZDpdbqWTGn9/DC
         rKpzXdVvaGic8I7XxYn7my2GR9nnF/xwAqOY2my/o1zehX1uRd9NGq4mOlDrs506pwc3
         oVWYdnH7s8vdJgS80SB5GCBfSsPKb3/KNSEWxoe3o3xosfVpRmMZvza+DVeR2+yYko5n
         znKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716554; x=1796321354;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5Ua8eli/eeePNuHrLso0Ijy+DWauR2C0WdOXLlgWKW4=;
        b=ogOEVTCZPOhw4u1MVa6T26CeLU9QqkLnsqGAQv3/Kx0pmw72ET7JZXS8oLWZhg6xpw
         S8dFHRL0XPENaa3x0CN4s5QKB5liuqpLKeVs/N/r9ewXNJ9Omf+AGnIEfy/RLgdodfFp
         /Oq2Ji9bxWWZ3+5Z7h4+xt0u6DoOLOgcHPHm3Hat/VyrDPWxEaXypsrzQpnrIj8VFhh/
         /9OlyEf8vz7mGLuRg3b7+xhpoNti0FvpCvRNNmQnNDb8tJngewE3yTK7uLpKFvxEndeY
         5LlR28RbiqNp/7zePTjZeAf7Fnn8zGj+jMpE95/eOCR4sHlT0xgPsLt1FKXDJFJNUSVO
         Al9A==
X-Forwarded-Encrypted: i=1; AL+hErHLNFmWYaaIXInrMLz0GN5u09nYB0er7cmPftRav7QJPkLTQTBO5Xb4f7cw7YzNc7mtMnU=@lists.linux.dev
X-Gm-Message-State: APuU4Z+3D15JlWRyaF+TF3r/YJ2+/i7XkbNfY5d5d9bbUkzG6a3g6Zl9
	sfqQRlj0yKMh5XOJzfiJHJuQNyHbCX4AmG7ZgAyXhxLjFoZ0LXkHE9Tv
X-Gm-Gg: AZFdTZf/5ycZfNGdNk1Ht5QE2dzenHR/cQrnRwW60dDzSIPnkub7WtHeYC+iLz5Evcb
	bziGwiCaLwEwAixTo87zCOgstYyadM1N0otz7k7KZmmzNHFl30a1viGJPtVzQqEnOnTasH0LLAL
	+IhUTGEwcsdobFibUpZ8yGdjvbSc8cORzBnEL2Yv/ndV0SF1UtcD5ajbObOYifd007rvDUk6ib+
	JNRJygwbdAVhjUAKV3/YcigsRz5R3WmL/7OvLVJMdmbVcUqyfJdU0GVtYF+TPvFVNZMAFF72MGj
	LkuyaImEZzvFZuYHJ1Ziwm3ZCbCQcGId/bU/FrcjvkKh6yg7jtlvycirjjjOopivNtb1MS967jd
	aFgjJ/Vi7vNXuEDT8JpK49WAe+HU74W2ZFAXVcSmPGgZPgo6UvQfEGJdpt/f0COKmlU+UxWtkYU
	wRO4tgaQDipLIs0xiWRnX7tiJS8LghQwbWTJ5fCTncNeCjwbZEDhYpHvrDtGOd4avnJ0G6XLS4u
	wpDEYGpxMddlGXptWee3sU3WvJ6h7seIEowm8hxfK1GoDiXJp5YVa7pQ3Vm7HPfMRBdwg9nVag8
	79Yoob8cRUdbLoq+HejELkVuqFth2vA/odcKoKSGrw==
X-Received: by 2002:a05:6000:2506:b0:48d:ba3b:af36 with SMTP id ffacd0b85a97d-4abb47b0f64mr52009407f8f.37.1795716553993;
        Thu, 26 Nov 2026 10:09:13 -0800 (PST)
Received: from strix.localnet ([197.250.160.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm50447904f8f.21.2026.11.26.10.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:09:13 -0800 (PST)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>,
 Navid Ghahremani <ghahramani.navid@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 mfd@lists.linux.dev, linux-pm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 3/6] pmdomain: zte: Add a zx297520v3 power domain driver
Date: Thu, 26 Nov 2026 20:26:25 +0300
Message-ID: <qBBdBMwWSaK2Eq9RGMmPfg@gmail.com>
In-Reply-To:
 <CAPx+jO_zuvcNnBWqUKJHJ246xEDb=FbN6FYKcrN+p6ERmjg2tQ@mail.gmail.com>
References:
 <20261120-zx29usb-v1-0-b0433258e51b@gmail.com>
 <20261120-zx29usb-v1-3-b0433258e51b@gmail.com>
 <CAPx+jO_zuvcNnBWqUKJHJ246xEDb=FbN6FYKcrN+p6ERmjg2tQ@mail.gmail.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartfY-J0jcIRweO3vnQrxe_bQ";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPartfY-J0jcIRweO3vnQrxe_bQ
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Subject: Re: [PATCH 3/6] pmdomain: zte: Add a zx297520v3 power domain driver
Date: Thu, 26 Nov 2026 20:26:25 +0300
Message-ID: <qBBdBMwWSaK2Eq9RGMmPfg@gmail.com>
In-Reply-To:
 <CAPx+jO_zuvcNnBWqUKJHJ246xEDb=FbN6FYKcrN+p6ERmjg2tQ@mail.gmail.com>
MIME-Version: 1.0

Hi Ulf,

Thanks for the review!

Am Donnerstag, 26. November 2026, 15:26:20 Ostafrikanische Zeit schrieb Ulf 
Hansson:
> This doesn't belong in this particular driver, but rather in the genpd
> core. In fact, we have a proposed patch [1] that is being discussed;
> but the bigger question is if we need genpd provider drivers to be
> removable at all.
> 
> What is your use case for this?

It's extrapolated from the clock system maintainer's request to keep clk 
drivers buildable as modules. The pmdomain is even less critical than clk and 
can easily be unloaded and reloaded, even though I don't see much practical 
application.

I see the following options, in order of preference:

1) Simply remove the device_link_add() call from the driver and add a line to 
the patch description that this is deliberate to maybe shut up Sashiko.

2) Set .suppress_bind_attrs = true and make the option bool.

Note that the MFD parent is tristate and unbindable, but that should be ok as 
the pmdomain consumers target its own node.

.suppress_bind_attrs = true combined with tristate isn't going to help. Unlike 
the phy subsystem, pmdomain doesn't hold a reference to the driver, so you can 
rmmod the pmdomain driver while there are active consumers.

--nextPartfY-J0jcIRweO3vnQrxe_bQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmsIa8EbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoiBIUP/05AbhnlM2LcacFX58EL
N7rFiT+lhfKkTk2WyMVEI10KwIOop+Y/Am5zrnL5YXQPyLWu8N+pfkUki9SvJSBH
iKKDQAncXwJ7lWkBISVb2/BxeqJxIHWfDJ0GYhYsaHxLyYo4PWMjT+tq9s+Naqvv
gu5WXpYb3F5sqS0qshsJicHYiU4z1vU9hg4Qazrs61AjDU46L6XpevR5L8mONzHZ
piLakQdu+Hp1LFMtu7mMqniIc/RnlRoL76NDcjP7BZ5iS9l+INN5R4bIYGP5uCJR
84bozcygfkiO6tlkIIcumE/Z5DtZfUlC+u4vvpy1X3jbtMokGZ9K+hpKLCVOQkqq
nklQEfe5EwJVW55bPLRj8LD3npSlBNsAWI5BdgyEqvBf4RuLdbVmodDK5dT8p4YM
/u/o0m891tAX9tp9dMrkPPJyyhHe5rmRoV9mSBNDzqLuOUfQcvhsHdyPgi/xFLY2
FHugaTeVu2QhrRUvurddqz6liNm5+sfy7uzYUtjVjQWxAQZ0GBnDKaVkIaYYUHnv
i1VRm13aavhPdH3WgQh//hh7gZZxc3zO4ioU9gRtxWGwOoCZOYhM43WrTmImaRMG
EMld6KpU6bCcuWmK9sC7u6W7PXOrExL+8Z6bO09no49EU90SimbONtaWrHM9i/jI
0jucOU5MLX8n7BJ4G4cwpoor
=3XcY
-----END PGP SIGNATURE-----

--nextPartfY-J0jcIRweO3vnQrxe_bQ--



