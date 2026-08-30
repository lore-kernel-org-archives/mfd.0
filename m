Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9D6299920;
	Sun, 30 Aug 2026 22:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788130259; cv=none; b=j2Y6Win7nBgaKBTcBsqMaMl7wSZp9bVOBeRTJdvlpkXjj9XIaDZXbB9fOTczsGjuvxgPsyTwqN8RCZ+vwJxPy//GV0MkX945+NCe5U8y+fNAdcEXS5Z43ZJg8OO1V3aq7E0NdLxpTBV7hHunx7t8JkeTU94je3TKEUt6a+OthXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788130259; c=relaxed/simple;
	bh=q7v/n7I0IMecARNdQUZECDVLp8cdyxm2OVcHiepbk9o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NQ81vs5pVi3DIQdvnl1phQcIC+caKhrbDfdQyw+VymWrmnpDIUkD+sIfZzqSlKttnGcl3UYf1hBHmdbCoE4Y02YIF+SK3rResXFgMAoG1QKGiHVsDZiFKjLvau17PbjF0cuFefNWvI9fc0zvL0mvM/kB7vKiCjW5trG+VpHCqxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WVUhq4BN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WVUhq4BN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2805C1F000E9;
	Sun, 30 Aug 2026 22:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788130258;
	bh=q7v/n7I0IMecARNdQUZECDVLp8cdyxm2OVcHiepbk9o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WVUhq4BN3Bp39ze3K9Iu3YkbaqoH3TPhzcL8by4ZVXWN0G0tOzoa4q3VqxrspyN7Z
	 aVFP+zUhsEx5jcFaOdrrUncAxVe0lLlVaYKmvOjhjE02cx15qn2anz8lyt+qM2T0EV
	 W8Ec3zBcSohk6lptfMkZYW9CNVPkjmOsa79H/RW1Bex2mHIWbU3imqnVv2U19zKoIP
	 fVsdZAFyXiOgHUkr8e7qKzmmEDS9ulFLPY5FpW6BrcQeeuG3XqS9I/Yk2PreK8UvvE
	 YCoxKoKIZELbCaLOAwexo632g5ywkRFyL858rQWvQVoQSMkY7Y7MEaiSICCHLajd06
	 GZYckURDWRwyw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 10/13] regulator: ab8500: Preserve OTP-enabled buck
 regulators
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: lee@kernel.org, robh@kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260831-ux500-dts-snowball-regulator-v1-10-fe279fff5e18@kernel.org>
References: <20260831-ux500-dts-snowball-regulator-v1-0-fe279fff5e18@kernel.org>
 <20260831-ux500-dts-snowball-regulator-v1-10-fe279fff5e18@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Aug 2026 22:50:57 +0000
Message-Id: <20260830225058.2805C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The SMPS enable fields are initialized from OTP and may leave a rail
> enabled for discrete consumers which cannot be described in the device
> tree. Such a rail currently looks unused to the regulator core and is
> disabled when constraints are completed.
>=20
> Read the enable field while registering each switchable buck
> regulator. If it is nonzero, mark the regulator boot-on and always-on
> dynamically so the unused-regulator sweep leaves it alone. Keep the
> enable operation idempotent so applying the always-on constraint
> preserves an OTP-selected hardware-control or low-power mode instead of
> forcing high-power mode. Synchronize the cached mode with the preserved
> field so an OTP-selected low-power state is also reported correctly.
>=20
> Regulators which are disabled by OTP retain normal switchable
> behavior.
>=20
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-ux500-dts-=
snowball-regulator-v1-0-fe279fff5e18@kernel.org?part=3D10

