Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794417092;
	b=G+IHrtihAxKmcby6/28jZpaffsL6lm9/EoJtqIe7PhJNUqe07DZQ6PmdkBprHjhlcYq9
	 /X61iocDdJPfT3xAWRVDFW9emSwCYAx7AGNS19LPmzP/HllKl8sx3idn12epXeTOgYCVF
	 3W8CCcAIbBAbLSmkpj68TOx7auKJZhgpUCj8hVGOZd5QyeReGZWIH3bssfKwdUZmO9MlE
	 t8gBTPYOgS4zkN84CLGwckkOHkfa5iR729dR/K0BdTCH+1hA5P16l+maAk3gc90WayXqG
	 zPjeFasuCrPL1mgjQijQ2BlhiFxfpFQ1xROD8XYwAWmvSTSUW+gRFtyihs4Tb7kwfWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794417092;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=DBhNq8ZmtjHpQJ2XfrsVqBc4b/Sk+/5pAcnsSqUV7mE=;
	b=a3vNQH3aT5HzN1HJ7/YvSYkSIC7JKsIL8Trh13pINk8V0Q5t+b2d/VeQ5i9ka5DaoGHl
	 rYzO9H8AQqImOUV89t2pUaCPihJiRmj/WjSNDZ2lBqES8wp9B2OmX3XvFbgG+0RCfcKgM
	 gdvu+FqxKdaSiTXhu5URlT/fc+JMdWpLg8kL2BLSLrhVmblxfHjrhOWwcvjxguwA/mi6h
	 igAvGUlyzhvvwklhVtrURFu3zjYpPwAEEDKdF4rqS680Y4747JvqQ9Rm9x3EYKpg3nPwe
	 6B3KdkEWEXhc/MxDnFE2GLUVwvx/qNOsv98WnDoZQFWu4p/B9mHDPk6gHe2dIvCYM3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T4zfgEs6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF51A606A31C
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 17:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=T4zfgEs6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23A451F00A05;
	Wed, 11 Nov 2026 17:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794417092;
	bh=DBhNq8ZmtjHpQJ2XfrsVqBc4b/Sk+/5pAcnsSqUV7mE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T4zfgEs6Z1eVBJul9WfRjoaKVKJQYkSpwn7vVh4WJDW50KnUnRaDofgeZSgUhyGJS
	 a8jLauzQBW83EyJx4V8EWlC0iH5Rhrhs2BpDHILZ4scC9J7UARZq+uJ78UK4J2fkXv
	 SWaQRr7s8kQV8y2kKmXs/PxW9PfTFqqeGKv2yODTLaTFD5MbUkmM5RpE4ht8v9mPxY
	 EYLmReiRdzQTHWyZqXEhsDO+SfRNtF/Wg3ZIgxYxA5hT40TBDrp3WEbRjIkvWIs1EI
	 VYD8IVbIKkwZewDRvQWmTvmXBpxt/MQfCh1ZCdTO69hsilujgzAxctBXnJODVO/NXQ
	 wO1UzRnkm8CgA==
Message-ID: <sashiko-outbox-209382@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/7] regulator: pm8008: Add PM8010 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jishnu Prakash" <jishnu.prakash@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261111-pm8010_i2c_support-v4-2-4549cab1c8e4@oss.qualcomm.com>
References: <20261111-pm8010_i2c_support-v4-0-4549cab1c8e4@oss.qualcomm.com>
 <20261111-pm8010_i2c_support-v4-2-4549cab1c8e4@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 17:11:31 +0000
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
> PM8010 is effectively the next generation of PM8008.
>=20
> Like PM8008, PM8010 also has 7 LDOs under it which are used to power
> camera sensors. The PM8010 LDO are of different types from the PM8008
> ones and have different voltage dropout values. PM8010 LDOs do not have
> a voltage step rate configuration register.
>=20
> Add the necessary changes to support PM8010 LDOs.
>=20
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Co-developed-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> Tested-by: Oleg Keri <okerixx@gmail.com> # Lenovo Yoga Slim 7x Gen 11 (Gl=
ymur)
> Tested-by: Burke Cates <burke.cates@gmail.com> # ASUS Zenbook A16 (UX3607=
OA)
> Tested-by: Christian Cortner <ccortner@gmail.com> # Asus Zenbook A16 (UX3=
607OA)
> Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-pm8010_i2c=
_support-v4-0-4549cab1c8e4@oss.qualcomm.com?part=3D2

