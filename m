Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5773B7B70;
	Sat, 26 Sep 2026 12:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790426730; cv=none; b=l3JZ+Lmh8TEgwwitHYb+wbzlNyr9hK2oOQIJdNARm0Wn1wvhd8wZR2Tgl5UHwNUBL+ba8thu2wrlRvM/cH1/G9vecDguQj5olOGaSP0eZ6IZbU/jsvvNLUl8KMNErEG9jhRDME0f7p644t4uHfvCS9FbF/Kh6ZTyKM+HlvrYclU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790426730; c=relaxed/simple;
	bh=zWV+jF0AK6b5u10fdPsAUq2OZUNO68M2vsH91sokhZo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OwgdKbymDxsp/b0PRenuaLhDEdsGWcOR1FQUFLHN/shoUsegRcS4Yl/IG2iSSpfxtRDxffylvOFTbWaP1UzO2VkJmZyWxkaHeh+D0SsB86DiGUsPTRWr55FrniZCh58lhoOThydmKXOzDWfTAGd4N5L1CArwx8RWbyifK8zrP64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cziOJWAN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cziOJWAN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C1B01F000FF;
	Sat, 26 Sep 2026 12:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790426728;
	bh=zWV+jF0AK6b5u10fdPsAUq2OZUNO68M2vsH91sokhZo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cziOJWANyKL4WTBOLuL8hz8N91/41VdQbWtyNywuGcVCKlBnaB2sry+agc5JEOvgI
	 qkPF+dlmpa9YUtNagfkKV6PgVC8v/6tyoHCXVLMwhaJfYp3Fe/zV2MA0hRToaiJVHz
	 2h668PSRP8If+P+r/IUSGi3hnbNE0C/Z3S3WYtat5dkh6TcL9E/kTC5OvNBG3OROp9
	 vwZsYVScW0uGoOyFkJqzlTOSOKmC8ZNAfc2Mkk5I5YYeZwH1TIkrH0V8+7GRQkw5UE
	 dVrGLHZNih5WOgICAjbmC4GKPt0dDfHrr4I2Jm47Z3K5JszSvwndjPdEKeTiHyh8gm
	 sEzCeb6zj7Odw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 02/12] dt-bindings: usb: qcom,pmic-typec: Update
 example with vbus-supply
Reply-To: sashiko-reviews@lists.linux.dev
To: "David Heidelberg" <david@ixit.cz>
Cc: robh@kernel.org, mfd@lists.linux.dev, lee@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260926-typec-v1-2-31adc19f32c6@ixit.cz>
References: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
 <20260926-typec-v1-2-31adc19f32c6@ixit.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 12:45:28 +0000
Message-Id: <20260926124528.8C1B01F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: David Heidelberg <david@ixit.cz>
>=20
> The vdd-vbus-supply is deprecated, thus don't suggest deprecated usage in
> example.
>=20
> Assisted-by: LLM
> Signed-off-by: David Heidelberg <david@ixit.cz>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260926-typec-v1-0=
-31adc19f32c6@ixit.cz?part=3D2

