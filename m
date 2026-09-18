Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DE0519E0F;
	Fri, 18 Sep 2026 16:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750226; cv=none; b=jlg4Al/VJGh1QybGNMaXVsPKIiTcL+AuTWovu6rt6Wcmjzht2Y7OZfKIzNCT/Oy6Pw+eksDl7P+73R8EEWtn86wHZv4Vf1fSW14DctpDU5l5VWfZiipCPdH7mAqSsRKF9cK0487k4KfZ3ekTwFsLpsRWW8oxsvRB+Hngfar2uMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750226; c=relaxed/simple;
	bh=wBPw4WZBiLV480c5KJEiL/At4ZVJMqPP/3MvBGp02mo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hIEI+R5WMhuYD0zlrdpGIG5Llbpv+63KQz+UWXI+fIjE5YG03132ekIyFTSE3qiZZtFEwLBOIkiQT0Bcns7r8g1eyOxU0YaU9MFf/4dYwAbIw8ywVD6Yi/nAYMGEWV+CxA1ouWQzLqU0i5NOR/qQ5BtXL/how5ZZIv81MT0aV28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jc/ojV9R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jc/ojV9R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DFFC1F000FF;
	Fri, 18 Sep 2026 16:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789750224;
	bh=wBPw4WZBiLV480c5KJEiL/At4ZVJMqPP/3MvBGp02mo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Jc/ojV9RrwRtmfEpzm12MCMlX2yu+86SdglsKn/lgM+QUvest7XeJiH4QD4cYFCRe
	 +nyoW6Y7bPLOF7/fNGEjkTYgqLVYl3l4RklFWzyBVRKDe1cCoqehVMsdeo0vssNTbp
	 0UXpinuYq5e1QxdgkR0t4w8m9prgjw1yyFRcI+v28HrV/bHJRGWhOmo5+1ZP/M46Mu
	 Jfu062D4U05Jhl2qJG4wBKmYWuHn4PCHteWVSU8wH229t/Qndcq86/FlStuBQYQR6K
	 PsmHtRcCgI6l046+3dGTqK8BdxTTD7HDRG4fGfm75jbiu7TzvaRkF9mTyeCoI1Drj7
	 Kgv1+/ZXOKoWw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/6] regulator: pm8008: Add PM8010 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jishnu Prakash" <jishnu.prakash@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, lee@kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20260918-pm8010_i2c_support-v1-2-de33d78fad9d@oss.qualcomm.com>
References: <20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com>
 <20260918-pm8010_i2c_support-v1-2-de33d78fad9d@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 16:50:23 +0000
Message-Id: <20260918165024.5DFFC1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

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
> Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918-pm8010_i2c=
_support-v1-0-de33d78fad9d@oss.qualcomm.com?part=3D2

