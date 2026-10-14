Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC1247F3D4
	for <mfd@lists.linux.dev>; Wed, 14 Oct 2026 10:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791974354; cv=none; b=iDyGiTKYk+k9UNz0X6BhHHhn7IscWwAJX9PjdwvxZqWN+LfOnNwMiWwSnvX5F6dlEtvS4LJIN1EHnw1i5lejKearp/1R2HmWoGTDa2W6uP+zIkzV6tUo5EuFyiaXtVCF4i+fK93GK4wHPFUDiR121aNV/8suhBT7wxFBH4dQVuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791974354; c=relaxed/simple;
	bh=AtX/8/SEF/aOcPqVhpcZm9TxCCVyoCEG9ZYHUhJ7Ueg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=mugoLYkzco7dmoVzbGJ4cav3BM1+sXqeDPeiAS4oeHrt+eRH1c/LHq9sCf1nWpnU9FfGiqmvV7TLgIF9yajfew4huX+yNPh1uphgCUVGXsn8CBwv4bhBMRA9WuX+Ad5mayMJ+hXAXhxeEWkkPhPnUSc6OmhXIvaj32g5+O9MRyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BFpXI4PQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BFpXI4PQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 989ED1F000FF;
	Wed, 14 Oct 2026 10:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791974352;
	bh=AtX/8/SEF/aOcPqVhpcZm9TxCCVyoCEG9ZYHUhJ7Ueg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BFpXI4PQe7OmxD61rqxJmPMVGX2ySVJrdR+cYo+uLptqKbgbByHfGdlqITSYV7BFY
	 AG1exXYXKNBgngBVphe8Iu0b0tFFn5CcO7pcFPoaKkHDzFZU5KFv43ks4AWdka6Fj1
	 jFshk4/5aj1VkuIpiUEZIlFHccUIbsrwR1aTmwSnq6pS294dl4h4v3ZpqEPxfGnBvx
	 irD4eezcL475hFdjIdT19XwMs4AQRQrrPudWoioqtcvadtAF6i2YUEW0PVnC8ppBzk
	 wWC9g3346KaMXbnQ88D4ArsRLH/jSnD+Etf2sMWXfu3dIsv6wD8+4cKd4EaeNQuDXs
	 +cdWYINawzmeA==
Message-ID: <sashiko-outbox-171144@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/7] dt-bindings: mfd: pm8008: Add qcom,pm8010-i2c
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jishnu Prakash" <jishnu.prakash@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261014-pm8010_i2c_support-v2-1-b395d2b3f668@oss.qualcomm.com>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-1-b395d2b3f668@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 10:39:12 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

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
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-pm8010_i2c=
_support-v2-0-b395d2b3f668@oss.qualcomm.com?part=3D1

