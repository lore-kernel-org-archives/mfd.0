Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795082477;
	b=H19cx/BxkjUMN3o7Xno/MlWDFY9QYc/c/bCVZCBl6FA1tb/cRo+I8AWJiS+IYfkL91pP
	 MSmPsalnlvMogzNTVBdKcsEwMJDZeUZt2ZTAWLzJvipWpASadtUzYhUJoLA+2SXk+iV1Q
	 0DDcAsO2g/S2Mn4zVS2cNikBwdMwpeu16zxbKrz2nQwtrgT349mHR1dwN0GPIoxJsy/yj
	 5X7GMcpPPTGKzbKFWoT3ioD8MfddEPDdLIPwl42/gesYV5tc6HuVEuQqQqfrNVS9lBcFx
	 xeWPq8y98SqSt0EvW7u966WQSpJpwotOwGEXlCeDC1bPoe6jtA5KYqyWlj9H6Xsx/Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795082477;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+AaX+2XpVpC6ZsK3xttN0tS9sD3Py9VGgNWqFYQfZwk=;
	b=QWF6CSdRZinopm9+biMvW+/8WlQ+kiwCp/9Q6BASuxYWmi7gGGtwFokk2LzcPuaUu9pS
	 31P8X3DyhUCpP7xxfiJT+USmZOrzJiVN3kGsdExa4rhqScT0rl6OCBxwuI3nmF5zRYhY+
	 3YXHvjXDkyxazudVAko1vq2Gn1RfQFBULXF6r8M7ME7LW3v6WbmUlgwy/TGL+iHBa9UA6
	 fnS42mO+4Pz4Bm9qDR207M+mi/A90rd99uOkUILpsBxCIEnRhue4b/q9B5qgemaQEM+rI
	 Z3pNCUST4jATLCcx736HwThCF9NfAUxtjo9MeIzCPl0Hf+NV6KB0WTjPe7GkfbQKU1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fUklYVtf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A188606A333
	for <mfd@lists.linux.dev>; Thu, 19 Nov 2026 10:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fUklYVtf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 009BE1F000C5;
	Thu, 19 Nov 2026 10:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795082477;
	bh=+AaX+2XpVpC6ZsK3xttN0tS9sD3Py9VGgNWqFYQfZwk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fUklYVtfDl7gDDA3HcvIQULPN3ApF0FEQ42hYBSRn8Tot1C4n5G0LD+90bVFL5x6S
	 qDK9D7PEAnRzrx3WsnhyOmJkWSAcqZ0NgCQydHnQrxFlbUSyO7UL36kB1auTf36SQ3
	 ICucLNZ2TGCa9bF4idP6XnbrvXOGpuaaWOnK+ll4x2UwMDPY3JTwZyZkByqGIqvFj6
	 NKFtGzcD/A9uc1y3zifC0wUs7AeimW4W7b+B3/WNycFvl808W+U7CfpmTKXLx17xDS
	 JJbnaYMoLU2ffuH1Xp0+h4uM4AA1Fdmmr7NqBguRXTmAKhwHrpOwgSiOBBf0EcEQxk
	 /cpbJBLKzqxKA==
Message-ID: <sashiko-outbox-222898@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v22 3/5] regulator: p3h2x4x: Add driver for on-die
 regulators in NXP P3H2x4x i3c hub
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>, mfd@lists.linux.dev
Cc: lee@kernel.org
In-Reply-To: <20261119095449.555593-4-lakshay.piplani@nxp.com>
References: <20261119095449.555593-1-lakshay.piplani@nxp.com>
 <20261119095449.555593-4-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 10:01:16 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> From: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
>=20
> The NXP P3H2x4x family integrates on-die regulators alongside I3C hub
> functionality. This driver registers the regulators using the MFD
> framework and exposes them via the regulator subsystem.
>=20
> Signed-off-by: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
> Signed-off-by: Vikash Bansal <vikash.bansal@nxp.com>
> Signed-off-by: Lakshay Piplani <lakshay.piplani@nxp.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119095449.5555=
93-1-lakshay.piplani@nxp.com?part=3D3

