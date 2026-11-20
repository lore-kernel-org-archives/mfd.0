Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795203506;
	b=Mie6U8njKpDOEvp71bZVrCufVCA/Zq0RoCus0GZsQMQGogrVEjcVPJ10OdXnJkfb79aj
	 VZjUUAkS2FrVnAqXNJ1YQN5J/zmZq3hshBpPwJ95IIiob7vzTk/vQNEjAndkediUHocL+
	 zC0COcoU52qn9W/ds6qP4U8Dx6Odr/SX4YNMQNOT7cMLvhyQP8ez3iThZkyRzu+svOqo1
	 k8FrQaQCtXVj1/AJdHhBgyUuznb3lTp/fT2TocJ4VCvrmKNa15Nyo0PoVUcKwXDDqBx//
	 5m1l2iGfqWOqtnRs9sOKxm8JA5bgTkHhR5CY06VNnRurgRIIMe36Y8EpihIon22cJZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795203506;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BNd/cbS+QEmMiqM4U/E620YfNOWBNBsrFLbzL2Qo/4g=;
	b=lvvMsZAJiBgiqNdQ1+1G9JkYDYV4kVGEnNfiG9S6cEZdXzq38RHGgjdkYZnfn1tVOLaP
	 WA2pFWiWrAi0UpBU5och15TkqmiYwpkqVf8VcMD8rqP6mp2MJKiGAEfZvSacPlexmMm7V
	 eNfC1G32L85cNgSOYFW3E2SXc57cOBNX3mY1nK3LxBto4vHPPt/FYgV137AIlrFcrbklG
	 xHXzxIEyDtYs9yvFQXAoVDpsfRmxidATg6jn4iy6M5RQi8mJ+em29KOjFN/9cURFRWQsH
	 pl95ecGPUuxgxTh4YN3jiomlWhQNseMe4i80mOncH/B4+n2Kxt+Xff67sYVBggSETxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QlXmtIOy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5081C606A6E4;
	Fri, 20 Nov 2026 19:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QlXmtIOy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09B2C1F000C4;
	Fri, 20 Nov 2026 19:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795203505;
	bh=BNd/cbS+QEmMiqM4U/E620YfNOWBNBsrFLbzL2Qo/4g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QlXmtIOy/kW1txFTmB2O/gpGBMpnjkv7ItDSFqvRdvNWy+q5/GcmUPFsT5l5AK+gq
	 TgtFF07bbeoSEZ1wGhXrh3y3rytQEmFEkgkPurO9eTgKBfgODn4ygo1zCq3mjXHqqe
	 YTxtFOu3FpVYlHiq6cDUXTys2krBLNJyy2FM0O7z8N7loBnQTAyNmpXzD7P+MK4XPJ
	 9J7S0c+KrOGuei7OsInbvBTMNhSLETpjcYQaRWyv+VqE2h36go8CjxfeUG+e70tXt9
	 EMnyyLyzvUFUTyB93IBN3wCEP1O92ytWVIOkHyOpkNKM74WgIs6s9xzHEstLNxlOEJ
	 uRzQjDh3YfO6w==
Message-ID: <sashiko-outbox-225934@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: soc: zte: Document zx297520v3 socsys
 controller
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, lee@kernel.org
In-Reply-To: <20261120-zx29usb-v1-1-b0433258e51b@gmail.com>
References: <20261120-zx29usb-v1-0-b0433258e51b@gmail.com>
 <20261120-zx29usb-v1-1-b0433258e51b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 19:38:24 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] dt-bindings: soc: zte: missing MAINTAINERS entry for power
  binding header
--

commit 4865a5ea2f1de7886db40030f6e9d98eb90cad89
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

dt-bindings: soc: zte: Document zx297520v3 socsys controller

This commit adds the Device Tree binding schema, power domain header, and
Ethernet PHY reset constant for the ZTE zx297520v3 socsys miscellaneous
system controller.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9b6a2da28aa5a..ab8797b8d0a5a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -4033,6 +4033,7 @@ F:	Documentation/devicetree/bindings/arm/zte.yaml
>  F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml
>  F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
>  F:	Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
> +F:	Documentation/devicetree/bindings/soc/zte/zte,zx297520v3-socsys.yaml
>  F:	arch/arm/boot/dts/zte/
>  F:	arch/arm/mach-zte/
>  F:	drivers/clk/zte/

[Severity: Low]
Should this section also list the new
include/dt-bindings/power/zte,zx297520v3-socsys.h header added in this
patch alongside the existing include/dt-bindings/* entries?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-zx29usb-v1=
-0-b0433258e51b@gmail.com?part=3D1
