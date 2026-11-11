Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794417218;
	b=1eP7ZOy0xYM9k402HNrGpli801C4ZNgYRs2WcVcVbR5oDCmES4jq80RaraRShIKjhFX4
	 a5Fm2iDB7wXIrZk5LAGx+CXHY7a4fQlaC6PsCNthTsKyVrjNvCpDKpCJZTVECGmBDXZHF
	 7OXNvxEddYwYBl64FeUmv6ioshaoJK3GJ/cBFvhTtLLRuSxh8Hq3eVSmrx5/f6Ei4jDc4
	 eqH2xyX4VW43bFz0LMNKX8y75O19rqXN/OOhvt9CpU1PpLgb6vDVX0iaD6/kxN0A9rLAw
	 prVSYpLQL7l1hYC2n/pmqJMz0m5pwQSCYmSLyZHCgBr+hg+TzNwsL49vwz3xZhgkknA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794417218;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Kf/2wseSlGZsqDDWiOtOhllri4I+2dXEMCtINhOS7ek=;
	b=2VxKEbB6+Ty30tdCipeVnWw3tI/1RuWdLk+5C11DaHSVvMELHUveXVDfrcCPgwfdV57W
	 +Z72YsYJ98yz/Dpm04Xk6P1HLxuC/Z/hIKm3qQEsMGFMpKFuuljj2Sc9LWjlVmC3PaRSZ
	 J1gB9o0Dz+wj4ogbNneg5npQKXM8qxDHTY46RFtQlHVXp6kgFC8y8ZssIKv9Uk5b1QMSL
	 1gYdoEb8CIzlGEIV4aaDqeCcqVWtYuL1KDIyrpTJefRscsQVtiNl5oRt6a2yJ62Jmak96
	 TRVlT7s2HZYLdAEohh8UahkLWiTgQbE6qCxojIgHw/njFgAEMWwfAuEsO63Jo1k0JKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Iud2H709;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45027606A332
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 17:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Iud2H709
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC7251F00A05;
	Wed, 11 Nov 2026 17:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794417218;
	bh=Kf/2wseSlGZsqDDWiOtOhllri4I+2dXEMCtINhOS7ek=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Iud2H709IdFEPzUBfgVxW7cGgyrQZ5FHU1H5BUM1XP3dEY1mGScoDOIgRRZWdV9Si
	 x60YATcDMXdNfkaZ0w5xcQ0pNCFrMrSpe8wS2JzItz2f8g0Z5LQNuMhq0v+CQ4i8x3
	 WitjEMW5el5S5ioQ0gXiO/q3L+d3E/GtdqFPuvNSe+FNeOyqlN1q0fBV0eNyo1rWyW
	 d5OC/EBRLIlHvQeX+O6Q4KggxoVAF+Tvql8E3YFgso5frnj76MFi+tdcPHGPUL3LJN
	 BrKUp2hHt7ATz7HH32bomOY2N2QO9OxavwjuG0fItrXmk42TtpruPCnPBEh1UH40ML
	 N2yjckLb5vOBg==
Message-ID: <sashiko-outbox-209389@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/7] mfd: qcom-pm8008: Add PM8010 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jishnu Prakash" <jishnu.prakash@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261111-pm8010_i2c_support-v4-5-4549cab1c8e4@oss.qualcomm.com>
References: <20261111-pm8010_i2c_support-v4-0-4549cab1c8e4@oss.qualcomm.com>
 <20261111-pm8010_i2c_support-v4-5-4549cab1c8e4@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 17:13:37 +0000
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
> PM8010 is effectively the next generation of PM8008. The device is
> generally designed to serve the exact same function - power camera
> sensors and the associated supporting hardware.
>=20
> PM8010 supports both I2C and SPMI communications. The latter case is
> already handled, since it reuses the same peripherals as other PMICs.
> The I2C front-end is more less the same to the one of PM8008.
>=20
> Plumb in the necessary changes to support it.
>=20
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Co-developed-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> Tested-by: Christian Cortner <ccortner@gmail.com> # Asus Zenbook A16 (UX3=
607OA)
> Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-pm8010_i2c=
_support-v4-0-4549cab1c8e4@oss.qualcomm.com?part=3D5

