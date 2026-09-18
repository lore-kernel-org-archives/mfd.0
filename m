Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94C3513545;
	Fri, 18 Sep 2026 16:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750265; cv=none; b=OoMDTmt6eik9vOz0cVbpeqRTBgBTB2SK+MSYN2agF/y5CS4JcgEpVxJFBxft/ay0/PdaEccgaRxZWyorKXbiEWRS5Rmy6P46qY7egWTlua9OZyrz3sysmmsZKoxBPYvWQHh4C2dUg+d8eyEUkXV2SCmOx9DA2//FaRijHqxIJkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750265; c=relaxed/simple;
	bh=qFBEpC2acFHjLdrCOpPFCM+Xy35ZyEwIHOYtsym2zQY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uNecZjgULWm9jsQfECLvdg46mV7JRwEK/mJmS69uKMmIdK0FMp2s2RFNpWMq5RUUjyk4NLrT+q7AfaLlHGQYv/OKXO29MwrZ/jW6VSTEHvxaU0YRfAO4Bd4JICGCDxolga8++kfDezm66LHKotJhQopQSk+ND9PY6xEv29BO53E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WfMwQVnX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WfMwQVnX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A01DA1F000FF;
	Fri, 18 Sep 2026 16:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789750260;
	bh=qFBEpC2acFHjLdrCOpPFCM+Xy35ZyEwIHOYtsym2zQY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WfMwQVnXsDPDwF2VvIRMMXFEsYMEldOWwvd2HZEiAx7gXE7rZLXsDgaUbiz3g+rEB
	 GBrha0rbcMMU8FcvAbzSscJSWd0jIajXJBgayHF9y+r8xAjzgpMo5Q1CZ5NjCvSDq2
	 wuuld0/Qtaoisa37jttlYYJEM/k2K/vY5839xMHR1b1nDRHeK5G9wEMgH9W4IkcwNO
	 SGekJoJo+GlfjxqTVhd4+9P0Qxj6oAJZjoQXCFXshzFKPyvYuWN5WyB5TJyp8SCuUa
	 NiU9oBmULv2YxCs5b7z0L/GqVeysByTxKaQPUBA4r+LX8jmDSGiJZzLXbXwpvjuDMn
	 HOx2ISgsaSMZQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/6] dt-bindings: mfd: pm8008: Make interrupts optional
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jishnu Prakash" <jishnu.prakash@oss.qualcomm.com>
Cc: robh@kernel.org, lee@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260918-pm8010_i2c_support-v1-5-de33d78fad9d@oss.qualcomm.com>
References: <20260918-pm8010_i2c_support-v1-0-de33d78fad9d@oss.qualcomm.com>
 <20260918-pm8010_i2c_support-v1-5-de33d78fad9d@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 16:50:59 +0000
Message-Id: <20260918165100.A01DA1F000FF@smtp.kernel.org>
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
> Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918-pm8010_i2c=
_support-v1-0-de33d78fad9d@oss.qualcomm.com?part=3D5

