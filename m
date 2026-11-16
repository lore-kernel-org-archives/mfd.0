Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794809898;
	b=kNHyLfbbF8IBoLT4J5HAFUXjE3iwKQgtbDd937s6rjaBXZz1jlBGNWqHlA/ykwqJdCNI
	 bHfq/k7M7aTscEEKURgvi3ogRVohv9BXbjp1uCQNPoAAs5mkKtsyISNhfr/Y8V/562uOC
	 hTf82tonnFa01LVMQ8+AhOZnqCkio2AzWe8NMrDre0cGLkjJD+DNwYO2F0/btcNs77a/A
	 2gjVTWgqM5qWPBtrpCMoB5rHYWvqGoQ8AihKzEjd2msvxcouTxBdaaFCgQRTDo8+9b8tX
	 EGziNrzPyIRQlzYpTZuvowrimxzaakwKMipSf648nZ8gppBOvOCVrdbZuvvzjbsMpCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794809898;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0hg5PTV3HO6cmhvN5SwQN5Kts6Hgj9FYoWjuAjDqCl0=;
	b=4je9pBw4uaD9Rem9DbyuV63FgRtXI3KgMexaJEwxCjltxUSf0ynZ6Gs39qsl6xKSWksv
	 Bon0I2gX2/x1buXWbzekWSOgRHlaqWnDwXufdL4uWx9IWa0eVQqu0LFcUwTQLQPx6LzKl
	 AwDXX/XJWoOhECQ3lkblRAxCUfVN/Rx9f7erUQ/7Ak3lzRvDKCxINC3Hxi4kQ43DUEEJP
	 AFVTxsepqc40iUtk/6M2CQwPpnhfwJ3jA9IpTGAf0J3upegcijDIyE03iRSbqOdxYpG8d
	 47TRs81d8HNV9K+1HCCJ/pHbPSj0r+WkRb1oQEronwtGru/I7IMCBWS4vR2alBib/EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FCmm4FID;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9FB606A329
	for <mfd@lists.linux.dev>; Mon, 16 Nov 2026 06:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FCmm4FID
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B2821F000C4;
	Mon, 16 Nov 2026 06:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794809898;
	bh=0hg5PTV3HO6cmhvN5SwQN5Kts6Hgj9FYoWjuAjDqCl0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FCmm4FIDgvaXu1rTkPr/IVMNSKZpIstqg8KTwuOx7xGM1ekWdE5OI9KsUVWe4qMMZ
	 Ueo3GXiS1SYLmtiQqOg6suD2/XhiL+br3WDrSpuEkQn6IEap69ruCRFwXJXs2XhVk3
	 wpIJY0NR8DcHVgEFIMWObmBxwrWvGxMj6uW73mhhgag8j0AwR2fwfmIqiH9wDrrqG9
	 ZUHy+xF9Fn9oHljZvOnEc0Cd5NCqc/D6gI3AgT1PKo+VWzH1mwNJaJFjgFeiDEG68I
	 tOecDjvQfGlJwj7DFliy13ZfPESUVWTAygivcr0SMySxMPq3GlvzfIPaTc2/5152nb
	 qtkoBcS90QRYQ==
Message-ID: <sashiko-outbox-216261@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/7] dt-bindings: mfd: pm8008: Add qcom,pm8010-i2c
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jishnu Prakash" <jishnu.prakash@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261116-pm8010_i2c_support-v5-1-5626ba17c0fb@oss.qualcomm.com>
References: <20261116-pm8010_i2c_support-v5-0-5626ba17c0fb@oss.qualcomm.com>
 <20261116-pm8010_i2c_support-v5-1-5626ba17c0fb@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 06:18:17 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>=20
> The PM8010 can communicate over both SPMI and I2C, based on whether
> GPIO1 is pulled high or low respectively. Since the qcom,pm8010
> compatible is already taken in the SPMI PMIC bindings and that set of
> properties is heavily tailored towards SPMI, introduce a secondary
> compatible to handle the I2C case.
>=20
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Guru Das Srinagesh <linux@gurudas.dev>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116-pm8010_i2c=
_support-v5-0-5626ba17c0fb@oss.qualcomm.com?part=3D1

