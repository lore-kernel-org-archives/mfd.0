Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B419360EF9
	for <mfd@lists.linux.dev>; Thu, 23 Jul 2026 06:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784788200; cv=none; b=PMrO1S6ESUq1SEf9FpR6+nPEd7Urz7N1AOdMk9fNMolSn/2mnK8wjVmbN92jnykOPM5UIboPvUOyF7v6KNyft8yQTa3apdZRu/h2u8gHikiQJuNds4bHzmPwohh1LDKFDPaWotHGdCG0cWTP3EpufEhzFEvT4pOxolVVA7Ot+wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784788200; c=relaxed/simple;
	bh=uozDH4XEIfou8SOxvvK+z4mvTO/pfJIURoO4Y8ZM6LA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O3aOguKD06iV0d/qFqOhQNI7oj31zeXBXe6vd8Cny/65RKyul2S/EYlbCfFtVb2vXFYZ/A7C1cdWOJEzxdahZAHXnnxHULBedVMYG46h4H0rdVmUQKIKhvLHJpLNsS400qNTCNwO2WBgTj7y2+yaMTog/z7Nna3s/7Z+aLE4vp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=M4z5WZYw; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="M4z5WZYw"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47f752b3423so133387f8f.3
        for <mfd@lists.linux.dev>; Wed, 22 Jul 2026 23:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784788197; x=1785392997; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uozDH4XEIfou8SOxvvK+z4mvTO/pfJIURoO4Y8ZM6LA=;
        b=M4z5WZYwpCvsaTDsYjRs+eVKmAFeC6xASar9Cj36tJl8o/tvAP0BzAD/gHTII5eNs3
         /R/QRnzOvVusHQJb3MaLrSW26CGHcsfRLM4H/4GTfBY9IF1Tx1jQOQT6I4WAyezScdKR
         TwBqKOFgwppOCWBdmDs87iMLoYpwjC94ko6SSC1uN1z7YBai9zaMyAMf4uWuSxAVdsSf
         xIOoKO5kb7RM55A/Y5oghCYATlGczSzpd2NnKeklfmgY5I/LtKSZRliyqvNDMhF3/p1S
         +NWrj7IRZl3x7fZ399hN8lJonV13MP4x20WI3iPGeb+qaOT7l2RM8fDK5H3yVAFzLMnN
         L0rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784788197; x=1785392997;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uozDH4XEIfou8SOxvvK+z4mvTO/pfJIURoO4Y8ZM6LA=;
        b=YQS5mPW5JLmWEwNrOd4yycj1+GIgOeI6aFQ+shjHk6OmDfOLn/NPVdtKgYxQsqvOQA
         blfwnagQescZC8gxakysaALUonQG04IOEN8d6ugYTBbEADxbfamjJiuSMXQ8KMUNM3lB
         pcB33BuGwt8XK6dovxkOUorDrv6IDTys41zUNg4IgX5+K4NX8f9Mkc2myc7dvSVaZtKS
         MiM2DQMz2Vb+VKeQdIEk3lJuzUGW1rrnffnFpkpzkRWdQX8VjI2aBvplnujUC/a4nrWg
         mu+9vzro1v1Kxcfr/hCkpr899v7aGIUbvjgJGwAWh8l0DNFvOV2eBCpeAD0Vv1XYuO0s
         tqeA==
X-Forwarded-Encrypted: i=1; AHgh+RpfVm5vemc6pnkUvrmIdtW2CaTmUt9Chl9rBgonj5uQDZGjimn0zbXlQH2vOmWU7/2gDbY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyAQvo8eF0Jn71gQ1HA4fE7atlnp6qv16ytUj7PZxRUHTvPoFRy
	CbFdhjWUMLNb8/Bb1//OaM8cRzoblZOHYMtWiE41jpg0pqFRddOhrUrIgcodQZ/eoNs=
X-Gm-Gg: AR+sD13GvOh0AI/DM3n9zA12/um02SktiDA0/mlM05tu6L7TNFMD4NOXDv3INPLnjYr
	Zh6c5IuSAT1nhQly0hb/BODoJg54w5Cjb2t3vaJatOY8QtOJZOPeVoWVUTsa+TswHATXyvd+aJG
	YKhQEXifAP5A35evOC8wX/Ldr3ZA4FLHhwySEx2oI7bzlZkyA6B3nsmatJt51AdCBy5UlD/DiCR
	l82kBhEsO/gpcmpjZOx5bGEfULTdvhKL1d5eNhW+R1Uaydzog9qiUU7Cc4pKkTYgBpBNVJZ/gvW
	Dl9rAfDVb+I944HPyMOh2dVo7uklxNY83H5ffCZRvL1aktCIMWJjd+HKJD21ekb/erpopR8crC/
	niFtgl/QPygeG0zU+NeXqgRkYLkfXTZQIX5CKtMfjGGiJcBxTwB6zJaZ28pIhqurqljiFjBDkVr
	hbNBHWgTs=
X-Received: by 2002:a05:6000:4610:b0:47f:45d1:7b74 with SMTP id ffacd0b85a97d-47f8dca6c5fmr1936289f8f.58.1784788197625;
        Wed, 22 Jul 2026 23:29:57 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f85c631fdsm12158433f8f.28.2026.07.22.23.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 23:29:56 -0700 (PDT)
Date: Thu, 23 Jul 2026 08:29:56 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, 
	linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
	Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: Re: [PATCH v2 02/10] hwmon: Add Qualcomm PMIC BCL driver
Message-ID: <amG0f57O5-e_Qg5z@monoceros>
References: <20260722-qcom-bcl-hwmon-v2-0-febe2805e17b@oss.qualcomm.com>
 <20260722-qcom-bcl-hwmon-v2-2-febe2805e17b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bd4y6yvvhvmkobl7"
Content-Disposition: inline
In-Reply-To: <20260722-qcom-bcl-hwmon-v2-2-febe2805e17b@oss.qualcomm.com>


--bd4y6yvvhvmkobl7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2 02/10] hwmon: Add Qualcomm PMIC BCL driver
MIME-Version: 1.0

Hello,

On Wed, Jul 22, 2026 at 12:00:07AM +0530, Manaf Meethalavalappu Pallikunhi wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

<linux/platform_device.h> already provides struct of_device_id and
<linux/mod_devicetable.h> will go away soon. So please drop the #include
for <linux/mod_devicetable.h>.

Best regards
Uwe

--bd4y6yvvhvmkobl7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmphtOEACgkQj4D7WH0S
/k49VQgAmlAG8muz6EMH5FjdlhV/oZNvJu7GJoTRj34gMkDOuJxv5eCjOKSjMT9q
kpJaIlEzPWBL87vMjKLjzIjbrmzbQCecyRprvXwQD5kRTcHIp6VehlZoXVoEkmVE
IHwyi4SD0DiEa8zfppjbcvaSy86X42bsR+zf9bWW2I4myMzanvPMEROEE7LvPJFG
/ZN2+kVdAdHJCs7RVEPmaOmb75+Dr+jnkVFQC0VV1f+KSVkZEpvd+fcQXcv3GaHu
n2iHyLpWtJeYA1uhY688Q+tPOwMAEwcHbgmIDoyYtC+DYHrlH9/4gqEsHVWD7vQO
fmjQGvUa3+No+e0dojq+d8Go1+fZWg==
=P/xV
-----END PGP SIGNATURE-----

--bd4y6yvvhvmkobl7--
