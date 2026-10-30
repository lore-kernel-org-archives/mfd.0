Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793341530;
	b=p1gZFqqxN3+Eiz/wwC7WVvxDzrKGElimgiLPVVmoWbhXE9erFZv+FpxNzxSS9t7AtyTX
	 FxD/+tomUe4q3uXfrewLz3URoogOOwj6O/80/0M9fd843GHChmO6cX1GT0ezSYrgQtQv4
	 X+2Qwvps+0LgHssSb6u2kVgcRyqnrtq1KVLNxdj7vkmAYcVgKcDOAlO7LCieuDh3i4mU7
	 ejh/lXwqllgp3++Y8m4qLhKkZ1LTqKuVTs4D+BVJSS18ExpMlZPIPjdx/0MJmUDkKP+rD
	 aGiXAgklCuFmD5gN5Lv8CfUyCLGVSETqGDYi/jBGOT1QKer0DIyluMfKATXnZqds56A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341530;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=cGSGkl79+Pyh10ynSCn9yoH9Ohm3NPnHa9AtfqcRDb4=;
	b=hnzpPAnVCOgZFJyx1SYS0Oi/6Y2+TGBc9RBXgYjYt2QjVIjlkFQ+ZWdwo92HIcicOttr
	 WEYKWzD7hFfgfufoFgK24MWYHm79G48KeFQCvBDoo43muMLd3bvZTrwqBML8QpdXWxX1D
	 P3kzlTqVyoVxHYxOo3nZ0GNf9edObfcAelhuAbekzhOoUd0L5btYH6VJOn2L+dP5b8gC/
	 qA/gs2qJYQlylfESt9WevUHgIsY3XlHtKGkwCjLVXWjw1BF83EERZR34/eo6rb96SR2vv
	 Gd84PNxWOVcQWLzjePdUmKDTQHxVUtvQU361Ald+laSirADApGISkc/PnPlaO9amEtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=asrgagzA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F03D606A31A
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 06:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=asrgagzA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FC6C1F000C1;
	Fri, 30 Oct 2026 06:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793341530;
	bh=cGSGkl79+Pyh10ynSCn9yoH9Ohm3NPnHa9AtfqcRDb4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=asrgagzAwpI9AvmBi75uELAhC/uuASQICmlgeaCnRN3keMfrpdhkhuZgcAKCI4LLO
	 J/Qkn8UwZuwI4CLeDVn+Ij6fWkxnnjvTM1hafijQPzh1LPlv38k6SfnySC36E16V8o
	 iICjNwKYQxPt+wZeHOElgP+edxlcB6pA7HZU3gHbWgPt9ILGyfu53eQ9Nv7b3+mXvn
	 il+DIWzZ0D1AjUgbAWRVa6y1SKazfNy7nnaaHjR/X/MqYXScDUCwhUagAx0mJOIZHy
	 lAw2dPXhhQSvwCjDN0DPfNnDpsEVRSyumlp4iz5G+kZcDX9nOvyWdlh2lnlCLs0eAp
	 xNDeeqeyond8g==
Message-ID: <sashiko-outbox-190595@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/7] regulator: pm8008: Add PM8010 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jishnu Prakash" <jishnu.prakash@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261030-pm8010_i2c_support-v3-2-995ed1ec7a72@oss.qualcomm.com>
References: <20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com>
 <20261030-pm8010_i2c_support-v3-2-995ed1ec7a72@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 06:25:29 +0000
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
> Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030-pm8010_i2c=
_support-v3-0-995ed1ec7a72@oss.qualcomm.com?part=3D2

