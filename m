Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5774D352C34;
	Sun, 30 Aug 2026 22:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788130585; cv=none; b=JMACw5XU1mHpZQ7UFzz3sL6Wam4cMRGQ8T/FquBoVLALWe3sB/VEYZCbWcKUZUVZV8yR8IcZ2Nwk6slQcwiwAfiAmwoHtWRGmb9RolQ9tVc6DdmKrVhwMVVJuXjldHGNibIENPJOuN9pcZCzg0nS7wm+1H1/qnilGhnP7TFkm6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788130585; c=relaxed/simple;
	bh=RK5Vzrxp6JF1F1bJ36jH2VroYyDwrdir3P3lTT1gaVg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LL7rTerHiCfQmH0wRPcnjEN4hFR+6dttgdsc2wIWmMIgUzu6dXKYXoz8t0juhdayCRTJBrPj9B272qwqfusU6yMbFJresgSaxpzBeFD/YCtzMxny2q1Xns+aIB1SnCGEAiRbQSIfJ5Z/422/Gd3X479ahi8MfNx0UdNjMBTttow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ECeCFEou; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ECeCFEou"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D715F1F000E9;
	Sun, 30 Aug 2026 22:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788130584;
	bh=RK5Vzrxp6JF1F1bJ36jH2VroYyDwrdir3P3lTT1gaVg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ECeCFEouMAGi3ulo0uWlugEJ+Vhz1iq+LFZlwTCTGlSXCgRTTgkjkVbulfQyKyZC4
	 l/3qSl0OKu6E2GBgkQuVtdze8407HtFAMuaOgi+c05/k0gpYlIDXdujPtaBAw69J8p
	 C2Aaau4XwYMs2KWWbcbylURVyNhlwVqxYA4oC1zsOm2VLCACRr7ousn4UDikuvfze1
	 f0d71u2yM4vNu+JAnAo2wMyZjFw0ONB/pj7v2JmYT+aUeBtt32HShrbP+bl/Z9n30p
	 baFJDZtzow+5HmdUpo7CQ5/CmQwBxrLiOWx3mGtO2YdXkOc1EttGbfN5bpRMTfll24
	 yWxKqWx4inORg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 11/13] regulator: ab8500: Use scoped guard for shared
 mode mutex
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: conor+dt@kernel.org, lee@kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, robh@kernel.org
In-Reply-To: <20260831-ux500-dts-snowball-regulator-v1-11-fe279fff5e18@kernel.org>
References: <20260831-ux500-dts-snowball-regulator-v1-0-fe279fff5e18@kernel.org>
 <20260831-ux500-dts-snowball-regulator-v1-11-fe279fff5e18@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Aug 2026 22:56:23 +0000
Message-Id: <20260830225623.D715F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Use a scoped mutex guard in ab8500_regulator_set_mode().
>=20
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-ux500-dts-=
snowball-regulator-v1-0-fe279fff5e18@kernel.org?part=3D11

