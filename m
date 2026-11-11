Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794416948;
	b=KXDdILKWKYjBsaTb0Q/XeiX1jg8QTN73BgzZ3QNz8oiX16Vje5/cLXqUERv3BmxvjRMM
	 KoU5t96+KH9NvDOzwB1x0dNCkxSl/AfHCtZBYHf1WwPQ+89BREJd1ZVYdA0An6gf6SabI
	 JHAtK1eMoo0TQVNmhcmok3Z2hJhxrInBC7bSgO9RTn0Xdu4uX2NMg/fiM9k5m/nqQ/fZU
	 UHWEaM9xeurn8Jz5a+JQXHqjIq17b2bSfP80vQM5r5HpuU50MXY7X7hEuHY9zjtECDu7m
	 KDphLOjgn09tteKej64GfOgCdmXbRyT26becJt2ijK6I+GkkPRab9u1aRBDnF2xBCCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416948;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=MWd+3CBeBs1l4RDSfduyuQK9hly7oH9Sl8jnvBO+LhE=;
	b=aeK7q1+BoI4zzOrExgrBhrp0/myluIMxuwWfV7zflANJErm5a+PRGor5jD884jLf/OzM
	 C6Zro9L2cjOTPOLTDJVw9RalsY+gFZm/Vt3UHC1TzC+7D5jBRl4HQYNqMSj2TzQUV2B9c
	 p7LpYZavmI5cdnsBgOKd/yE1UwyEZt553heJOCyHZ4aCFdR0u8wB0xC2XPkNJwL+nqxJ3
	 IS34TsaxprCnYkCtbrwrhRHtUMMRADblOeiyz4aYt0rWkctC3j6ido4N02Omz9tpswS7W
	 v4Ahz6/k3oJ3U/kNHzrImanWhW0YtRO2maCaNwMtaRZde+WnBqErEyaqpWT4oWc4Z2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ANMZFOpK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75589606A324
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 17:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ANMZFOpK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1CFD1F00A05;
	Wed, 11 Nov 2026 17:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794416948;
	bh=MWd+3CBeBs1l4RDSfduyuQK9hly7oH9Sl8jnvBO+LhE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ANMZFOpKWxIJ81UhHAk0jX7Z/RrJ+c/V5VCIMkC1gPc+MD03bL7ZbuA2035U0Qnw3
	 YcmSwEWljuJ6Si5zpVR0qjtkw3FBTMHDF47cG1T5Q0XsImn/APXJnYAw5H/9PnoyHk
	 X9lY2XL1+KWNlI7Pdq3cbhwVCroZD2GNkNWaOYvrLhg5Ym9ZC2LkXXnMiQgYFxh07v
	 tJ9zXJFtWjvxm9HHH2UAfvkW0U+d4WmrOXJIxwKA0ZRE43a/jK0wPuO8Qf7WaAVVYU
	 hExMXZhPqJ249GRWSFR3Px+9wyM/T5OloIh8SDkObW8idaFGmmwOEjo1DJ4rqFvmuh
	 dbpH8uEs/7xow==
Message-ID: <sashiko-outbox-209376@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/7] dt-bindings: mfd: pm8008: Add qcom,pm8010-i2c
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jishnu Prakash" <jishnu.prakash@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261111-pm8010_i2c_support-v4-1-4549cab1c8e4@oss.qualcomm.com>
References: <20261111-pm8010_i2c_support-v4-0-4549cab1c8e4@oss.qualcomm.com>
 <20261111-pm8010_i2c_support-v4-1-4549cab1c8e4@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 17:09:07 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111-pm8010_i2c=
_support-v4-0-4549cab1c8e4@oss.qualcomm.com?part=3D1

