Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418032;
	b=X5Wu8KnjQ8Ew3tHbxzyfVzRDC+cA/X7yJ+vXh0VJxMVQCL7tSgI0X6B+cae9Tj1NsY4X
	 TGmfnRI+HFWOu5wp/7KFPDzZYKYnptDNZUwbH4NvMCUaPEtN9jr0sUN7/o/gi7k4RiY2S
	 umKHmAggvdUh3JaTaSA3NLNUvyH6KtzSzgbLYqctwVDwjwFUJ2navlnPwteCDczbZu8T5
	 TpbBIkT75/jJU67qCBKa4WMUPkz26JuwDh2x2x/saJ1DeqR7vzkg96+C7fyXm7dKm2A0F
	 WjcWfioUWWvJk2WNDgwVSgNZGimT2k6tFixnp5GFlFWqqTQk6CbsJDnv8bObhdV0L1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418032;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=UKmyAuMTCizaLamIF0zsPX5yZvtJBo0ZBS30tDHT+fI=;
	b=DVMSPJS/98CpVmtMf2xLPcPxCegC+7SD9CU2h1KZmhK/EfORsQcO606HCezs5xKYiM9z
	 /u5qsmhEsNZvLmdoaYKLlP2435G5zT+WL51F4FRDZAN2PzN69K+sBpglZ4u2RCA2c7pYB
	 GrYAnyxwVziFA/47tpKGy1pPJXl27u6/woSr+xyb1BjBZw8kLzP5IqdFmd+Vi2hy5exbe
	 ES3Z4yMEn9ozYaPFujcV81QPZKjKpBtTkO6Uiii1EtSNyIquk7+AR2SSlyJttjL+tdAY4
	 Sw9frVi7ObfCsTXg6fKqeojcBcfPLeJfi0BeAbUeFF2f6q33wCS9l+8nEKp+fwC28qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CqAWvx10;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAB2606A31C
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 17:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CqAWvx10
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B3071F00A05;
	Wed, 11 Nov 2026 17:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794418031;
	bh=UKmyAuMTCizaLamIF0zsPX5yZvtJBo0ZBS30tDHT+fI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CqAWvx10eVF25W3mj2Fyp+QtKSIDeb4CT+yLtChYrNZ8d/27XLJYcDXy6wm4r/nzZ
	 tHaSinaw8e3MbwPdy00D6KEjhzcTJAFFZj//pgey11DuBB0dnDTEPQ6LJEhPRtwJJN
	 dmqfKXOqEQ/tEILEkb4Yly3F9o+c+Hf+Vk7OYgC9R6MLjorelOszXR41XjbCzaZk0/
	 +SqEdOsxU5Exc0bkdskY36qfwO313y07j//p2rNzQanH/twZYr+2cYN7m4bX0GSx1u
	 FZ4AdUzbXlLNc4iM3MEs9wvjFmhoxELFNagcgBiEG3t13FyYY52TDtf+bOBOvRjmg7
	 Atr4AKK9u55MQ==
Message-ID: <sashiko-outbox-209410@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 5/7] zorro: warp mfd: expose the voltage and
 temperature sensors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paolo Pisati" <p.pisati@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261111163735.227286-6-p.pisati@gmail.com>
References: <20261111163735.227286-1-p.pisati@gmail.com>
 <20261111163735.227286-6-p.pisati@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 17:27:11 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> The diagnostic frame carries the 5 V rail, the backup battery and three
> temperatures - the 68060, its NTC and the ARM - as IEEE-754 binary32.
>=20
> Decode the bit pattern with integer arithmetic into milli-units.
>=20
> Signed-off-by: Paolo Pisati <p.pisati@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111163735.2272=
86-1-p.pisati@gmail.com?part=3D5

