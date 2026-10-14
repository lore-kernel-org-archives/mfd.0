Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186F51A9F90
	for <mfd@lists.linux.dev>; Wed, 14 Oct 2026 10:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791974852; cv=none; b=TRmwUekQZULkj7iSrZm3ItJiAMwBLbjVyoZJvu/vQJSvbgoS88j6+s2919VqT3O4GJZ4bby0ho4GO40N9k+MAVw+IXqt9tlsR/xBjia+UO3ewYr92qKVjlIWM/oBcm8pkHhjBQLrTbI9V2JV5i+4srurioTylDlBtqMfQ6WIbsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791974852; c=relaxed/simple;
	bh=8hKnqSNP9iKBpXmbD/7761v81SnD1+x1BfdqJpV092o=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=cwzpOYlabp5fyU2GhS0/SxDk/gQLjSJ71Ak7zBRm3KS3iuDGwkyrkhR+D8a4VTc6Unjr9mbBL+7+Xo7XpDr3aMbqW2EFpDwxDWHVUN3YI8lVfMRe7DVRjMBIAMyZ7LLjZ1CGtd3Hk/pf1N24vYHAsu5Xo3bBeuh2bL5TA7NV3Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kcUmaGsJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kcUmaGsJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0F561F000FF;
	Wed, 14 Oct 2026 10:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791974851;
	bh=8hKnqSNP9iKBpXmbD/7761v81SnD1+x1BfdqJpV092o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kcUmaGsJI7srjQ8F2eDaJcN3Yujjsv094mVHVTZSs5mzgFP3DQfh8J02XjrobOFXQ
	 XSGX9l9Fk8cASV7CupHxQ8baIDld7Tfs52AEFBiXMF90TgqXDtc5qLe9wsNXKwaaLx
	 gdkpqTPbmRgDNesQbyTLVTlIJvBu/0MyLe4hSNWuj1XpkiBnZkVYG5jIm9Ag7NtfFu
	 FY1mIA5Kh5ZdNSgy3h+9ZWJb8TWVL2onMlzwgTRK1X6xCpCApNsxh3RyfHDR03UJlX
	 Os6vXXglDLiFC/wWWe/YQBpIonW5JEtTdMqEMd9zyANmomiX4vjBbMf118HCDObF+6
	 u/bAJUIIOVvVQ==
Message-ID: <sashiko-outbox-171159@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/7] dt-bindings: mfd: pm8008: Make interrupts
 optional
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jishnu Prakash" <jishnu.prakash@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261014-pm8010_i2c_support-v2-6-b395d2b3f668@oss.qualcomm.com>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-6-b395d2b3f668@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 10:47:30 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>=20
> Some designs integrate the PMIC with the interrupt pin left
> unconnected, deliberately. That of course compromises some
> functionality, but the core function of programming the voltage
> regulators remains there.
>=20
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-pm8010_i2c=
_support-v2-0-b395d2b3f668@oss.qualcomm.com?part=3D6

