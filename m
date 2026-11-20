Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164354;
	b=IHsMG9f6k6R3lYD0beNspYFHXynx/uT75oJBVgFHY4lnluQTb1z8Y2vuZI0hlpaTv7fq
	 nZDcHxexATic+18YkQRfkKdfR7yPfqQBTrXmH/PjhO9l1+bh8cvL5srsTMI4s0KZIEsb2
	 at5h9FKYDzF6n3r5gFWU16dEGt9F70dxdk+wZCCjDvmHgrkoTmDSLfLv3WwMRaTmASylT
	 1LS+nMVuhZFF9Pnra+qVd4vatu1d95fjD0xGL/qLQxmjbCmS5kinUAvTyU0zKH/EJxr6t
	 MqZHGXDaW7BVaH8LWkh5l7hw5O4ty6+I4rY2V4F0cRoKLmi97urMXsOAe74emW/2U9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164354;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=TuNi4wrptdjVe4bh5E4ssLLf6rqA3e6eHzokBHF2YjY=;
	b=oL4HodcNvXBOlZ4pQA9JpP7mdsrMkKPdmscUBYMBfR4ibdJaC0yS6C/DevO6wJwVto9p
	 jQP+7YNy0JI+iCWc/vtyKKf5ACgVfD022+MMaZCOE44BPhqMUK4xyUAOv90d9dvCsvs6L
	 d8WWZuV4NJwg5y+ON2BhBBtvpxUdoSUpectkfMFPQra+iMlkDBDs1iO0VFf/dGGVWTNe+
	 AHR3ffJHj7FEfSh1bkncFiy8utIQn4DISUFOiDptnnaoOO+lPWQ2TPAdR2LCgxFo3JbmJ
	 JxYo9f23ag1rH8eP3G6ZMZDhdX/v41E9ikwUR78545nPKwgXBQfsRCeZ3ZOqRjN1X6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qcifs2Fw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98714606B4B8
	for <mfd@lists.linux.dev>; Fri, 20 Nov 2026 08:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Qcifs2Fw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 003D51F000C4;
	Fri, 20 Nov 2026 08:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795164354;
	bh=TuNi4wrptdjVe4bh5E4ssLLf6rqA3e6eHzokBHF2YjY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Qcifs2FwbR+ct23KaGKbr0NjbPJ/YdFVfFZJcCdNPg/q4dGWXlxRDEwAkfZS8ZuDn
	 0HzE0jT1TKu2+DEd1O3u5D7IY8z9JEEObO8ggxZWRrlVBjCAC+uRFGW2sXtHlyzcdM
	 em0SfHoGVmPivGPLJIgqZWCZimmEWeUvGN9liUxnFTPoZGD6Szz4GoTeMVXp7GvnXA
	 M3UbTCd2ucRCm20DKb4eDPDZfWiMOnYhcFXeNNmMZ9Va12HdFOYJgUjCsy1GBbOue1
	 HGeYr/ZvrTSAZS4gRGvM0JoGCooFWrVFpm1QlW4r4R03anZ59OKWA1K/N6ViySxD/p
	 caaorE9bYYzGQ==
Message-ID: <sashiko-outbox-224765@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: ab8500: Describe the ULP PLL supply
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261120-ux500-mfd-ulp-pll-supply-binding-v1-1-2740b61bd839@kernel.org>
References: <20261120-ux500-mfd-ulp-pll-supply-binding-v1-1-2740b61bd839@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 08:45:53 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> VintCore12 supplies the internal ULP clock PLL on the AB8500.
> Require the supply on its clock controller so the PLL can be powered
> while in use. The AB8505 does not have this dependency.
>=20
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-ux500-mfd-=
ulp-pll-supply-binding-v1-1-2740b61bd839@kernel.org?part=3D1

