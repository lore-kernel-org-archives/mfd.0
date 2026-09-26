Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C86C547057;
	Sat, 26 Sep 2026 12:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790426653; cv=none; b=uXAD4jxtH/kC3cZ2DUSaorg6/QGeMpc9EKGJd0PF5K8C3WVaKCiwMkHtc1eAAxsBqeiOGGvjXErT+ieGmngRjVoSDU+i46f8GauV5HwMEAZeAJR5Qbk3iqiXJEyT9PPteKZ/zlA5zWvG2dvv7tsi0Z6eU2SWAK6o3JUeLnx1EiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790426653; c=relaxed/simple;
	bh=C81fiA73B5uq14amDfXfgVq0NmJDohlV20cLckFX70w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bwNPl7sEsce9GaGz2aQrxgGkYhqpUpnvuKP9Au+VhqYr8QGp/88rTlqTIxElqy1j+bwzavOLh7URG5PkJN1rfADno7Xly3Fjjh1TBMQwgpf/umtdaiBwH7RTPqI/8hYMNaSYnTt2JJlpGlHu0uS2vQ0ID2Zl+xCY6PrErrbxIUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HJh29HcX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HJh29HcX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B41071F00899;
	Sat, 26 Sep 2026 12:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790426652;
	bh=C81fiA73B5uq14amDfXfgVq0NmJDohlV20cLckFX70w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HJh29HcXpA6qW8JXWxczKK3drD16q2Vj/n8Snh5Sp27PHxE0Il1SMLhyzh+0DQOqC
	 HxZwhKm/oU5CVQL+RibScnj2wTzasJJ/g+tso2ieq/9aepPelJeApwAbSq3kFvOuEV
	 Ku9kutKExuWXXc5Kl4KvoA4pDsZCDgBvJtf1U9zWXUQLKu/67u7AtBoqF4bAO1ITyh
	 7D5+2Nk7Xe0CFI0M89SzozaH5EV1yS2rd60V9cDnoZkXXb4zmRELZDrvDGTR610huR
	 3x/QDEaWB+239fXAlXTWhLw6xy04YmUET3FzRNPAMkUHItBcupMtlWM3XFSibbCwp4
	 oiM6+8jt1ZMSw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 03/12] dt-bindings: usb: Add Qualcomm 1st-gen PMIC
 Type-C
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: robh@kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org, lee@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260926-typec-v1-3-31adc19f32c6@ixit.cz>
References: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
 <20260926-typec-v1-3-31adc19f32c6@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 12:44:11 +0000
Message-Id: <20260926124411.B41071F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: David Heidelberg <david@ixit.cz>
>=20
> Add a binding for the first generation of the Qualcomm PMIC USB Type-C
> port controller, found on the PM660 and PMI8998 PMICs.
>=20
> Unlike the later standalone Type-C peripheral at 0x1500 (e.g. PM8150B),
> the gen1 Type-C CC logic is part of the charger's USBIN peripheral
> (base 0x1300) and signals all Type-C events (CC state change,
> tCCDebounce done, VBUS change and error) through a single aggregate
> "type-c-change" interrupt. The USB PD PHY at 0x1700 is register
> compatible with PM8150B.
>=20
> The different interrupt set and register layout make it a separate
> binding rather than another variant of qcom,pmic-typec. As with PM8150B,
> the Type-C block and PD PHY are described as a separate SPMI node from
> the charger.
>=20
> Allow typec nodes of the Qualcomm SPMI PMIC to use the new binding as
> well.
>=20
> Assisted-by: LLM
> Signed-off-by: David Heidelberg <david@ixit.cz>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260926-typec-v1-0=
-31adc19f32c6@ixit.cz?part=3D3

