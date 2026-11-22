Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795356115;
	b=LARt188I0joKxZqWTXRM58Sq3LqkBdB+jqpYtOWPfu4WUSok1VTAjqEjboZXu+09YI2R
	 3kWEwE2dCZ9nU5+7wfoVYtQoUHUcAhxBNTFGxwtnAqAYx29kcZd2ZMLGQ5hIuLuS9DrfU
	 HGlN+fW5lAmX3o6R6FWC3HhGZcvjafLL+Fr9seHaKXhbzjiYaEJbCPUDx3hqMtyCLEWCA
	 gcWy4spgB1nXKk+f/1oGeM9IsnaqHez9w6xJmGfJNNU+a+pPBSL7UnEMqP6CE5mSKzjXO
	 UMalS2se2zLIg4vqHMLnT1h/yl2Nb38I1U0tseJlqtQ6j0SdJ/HGOmz40kMRD3Nq+oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795356115;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=yT1U5WtelrrqDFwJwgmCSWKz5xiMPbjJ/jls0PJNzqc=;
	b=R7XeWS/aazoyLbktNAOEYY4RmGZVzljboRnzXcysPKjoHWxxDyOZF11ligQKOnHJSsOb
	 dSBAPY4lsCSwJm+qsXuDIv1hCL3Kl2KgWp0mGBlSZ8ufpgCSUMaapPy+qxazI0snqgWbA
	 vG19+FD6hCeeikvPjumkRFM0lEoJGCre7gd7QwA9FVmtRtH+Yldeb+UUHuqu8kdAjeoCQ
	 IHcSSZePjlUmgMCs2FerZmJ3LxmYaeNOwzWiSopnLXMmBEQCFSGvS1mZbMURDaQsWlC/L
	 Am5xkPBzov31gOh4xi0MP7iv1zPwtzmxX9JPFs7VkOaLgFqJSir7pw7TFFw3nmwdi5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EunwfxVZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A878E606A320
	for <mfd@lists.linux.dev>; Sun, 22 Nov 2026 14:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EunwfxVZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08CE41F000C0;
	Sun, 22 Nov 2026 14:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795356115;
	bh=yT1U5WtelrrqDFwJwgmCSWKz5xiMPbjJ/jls0PJNzqc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EunwfxVZpHFEybY+mXWv1xtjPQXu2L4xVDdXx8vrmTD5ry7Z2NGVvo13dNDRataTW
	 oC1OIJ/9TdrELLlNbVvSm0PAKllG5xDzucrMG/HpifTLuoX/xkpcwNPfp/zp9eDHT7
	 lrGe0gillBq+S38+s1s9KQZTlTGkizuIIRucgjiCeiPf6CO0uXvdy8Ea7hLpdaG2QO
	 VCpgShgyCuEM/8rLgbzXqOAFhiFoWiOv7h3zReP9jkyr65xJjBv+s1jWYhteIaiqMU
	 qYTAVGW8E8zy0y6cyeevKTFLeWmdk3RXUSJQoyb1RC/G1nOM7umsjjn8coQLQzpn8u
	 VIRNE/SXEubGw==
Message-ID: <sashiko-outbox-228003@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 0/4] Improve MFD_ASUS_TRANSFORMER_EC dependencies
Reply-To: sashiko-reviews@lists.linux.dev
To: "Geert Uytterhoeven" <geert@kernel.org>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <cover.1795355432.git.geert+renesas@glider.be>
References: <cover.1795355432.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 14:01:54 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Sashiko has reviewed this 4-patch series and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795355432.gi=
t.geert+renesas@glider.be
