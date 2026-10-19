Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0CD485CDE
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 06:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792392805; cv=none; b=NBvTyzXIEkACq1IpSoQl9Dl1Vv8Npy1qf3TLm30LHPhzXkL8hjIRdLyGp72kMg9qjpX2dOXAbKZlFWaG6VsPKyiWi9V60R699DqAvdz0VjZMpICQBWqITi4uul1pKB9gUs/Od9dfvwUOmqLjY2tQzrKd4zFtm51oFiokPMXmlR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792392805; c=relaxed/simple;
	bh=XM0c64kJ5bkM6se9bFb6y1Q22QsXGV+KHZXfSxRlDPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W5SFQ68x3ifCSF5TfoTQBmQh3m7tZhslL60gbM6XrgTBPSUslLNcn7R/hr8AqcjZcmhp7SAgvK94Hhk5AowgUEWwCk4D6BLH3+ULfgLgfGhawpdAWBWkY22AC8e4DnZx1+r2P3y8C6qZ0Ldbdjemm1ME0U7whdBspZYD6BKC5Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=FTvL41Bh; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="FTvL41Bh"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so11806835e9.3
        for <mfd@lists.linux.dev>; Sun, 18 Oct 2026 23:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792392802; x=1792997602; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XM0c64kJ5bkM6se9bFb6y1Q22QsXGV+KHZXfSxRlDPY=;
        b=FTvL41BhQUAWOQJLfiMR3mF+Z7o+uljfWfx/mzwJxhLdHU/rVjExUGwoMVXgfdH/4A
         U9feHGHWTAz/Rq36NzHei3rSAoOglnGelh/HyhtjkEJ1+Q3SP0wyNu2iqf6ZdjoE/bZv
         btruwr07SCrmgokObLmnuWrpBI24j0YMb8CjzzzWMwU3oIgCB/UCQVtJKBNO/e1WPfVo
         lKk0JcurjhpoGgwv4A34kMbSoItBFm/aBI1VRrNq2/KyiNFlYcg6zWYgFRiGek3eCEHz
         /nZaHQELbYE1pvH5kYUzVM0BC8ELuVLAQLmtZusTrCQoK8NfPaHRS0j6dPKZphFiqvsH
         FDKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792392802; x=1792997602;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XM0c64kJ5bkM6se9bFb6y1Q22QsXGV+KHZXfSxRlDPY=;
        b=oGgVsBZ8Z8oogJguJRm5PhtKpxu0UlSKp15PhOpuzi+1duTrATPA212Fwoydg3X1bq
         VFR3l7VGPcgItQB3mNGF4O7Tzmxc9kk+rmkU/yWTvVmck2XxKVnU4iRq7k/XsyESZGlU
         5hkDuecA2N8xJWjsHXZVW5mpOf/5k0sL902n0PsjczopU/eeLarcimOqkZuakKbB63Of
         UJWHq/c7BgFzc1GJuI1kQaFyXeI2Njr8Bl+vLWWSBXBa5mQnebebGQEtoD8RORsgXXoR
         UttAHErwvijyv9nfxRxYZBicseqtwD6cAyZMFJUa5kA6WNXEffMzzcnB9fFQYwxlwM4h
         K3dA==
X-Forwarded-Encrypted: i=1; AKwUvBxmBiYXgeDjZ2PX/NVxKvy3lExOm5D9JFYDaCdK4pD6ns3T81QVMrhAJ0pS3HLivj12ZyA=@lists.linux.dev
X-Gm-Message-State: AFq9FYKvEJW4FwdFXUFrSmmVQn0T1+n1udzjTQzqHuSrPXBDiRcUXY+E
	TpF0UlTISQCyKiT0ufllKOF/ASBGN150RtKwKhk/6MA2puitEZxmdh9xJcPWpDbxp60=
X-Gm-Gg: AYBFou3bO1w9+zH+pIOGJ21bZgo1rz/BP7uFCF9ufW9QB0awho8MzHU/ZJEbJt5V4nj
	slhZCZqbD56VeMZpjei7p0uMvfU86UpozAf2AxM2sFb6nPfaaFtFRYptMffJdhxpiKSZXsMjLK6
	S+RH496R+xXwSZJi2WJWj2JJAOtHuH50EtEn9rQGknUKB9Tz76eRAyxPoArLoCO4DT3UudA1VTh
	OWwXdFDF60A6FDjP/1OOMPMJGBHVikWoLT3IzkUcNO16qQioGv7sK1A8Oxw9nqV2bmMZKxQaG5K
	ZtH2o3bFaVXRRoWkEs1kAd0G1ptqXr6g7Wgd6yiWMentQPchTmkl5Jw+C70LROTuQWDoBy2KUj2
	xxwa+erP5Jq41NBjfU8tgvacEYRqlBZR4EiNbGBxQslGDV2Wt3pNBqWIStjyeuvaHm4p6dLHr5+
	4jF3160siSZN6EKhxzlCm0WPAFtYDwWX+bakbYy+sRcYLdG+kKG9SrOgljlnWUuV4yJmZMp1XX2
	d9ajdCFuMJr2cs2/P+mupfPcxigLQBMCsv9zYdYV+ooxy88AsXAGKvIRflmKtvEURJ1oOz/
X-Received: by 2002:a05:600c:c0c7:b0:4a1:d743:77f1 with SMTP id 5b1f17b1804b1-4a1d7bc2e33mr89073635e9.24.1792392800952;
        Sun, 18 Oct 2026 23:53:20 -0700 (PDT)
Received: from localhost (p200300f65f19a9041674bacf58593a35.dip0.t-ipconnect.de. [2003:f6:5f19:a904:1674:bacf:5859:3a35])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4a1c8de7230sm246009675e9.14.2026.10.18.23.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 23:53:19 -0700 (PDT)
Date: Mon, 19 Oct 2026 08:53:18 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Lakshay Piplani <lakshay.piplani@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org, 
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, broonie@kernel.org, mfd@lists.linux.dev, lee@kernel.org, 
	Frank.Li@nxp.com, lgirdwood@gmail.com, linux-gpio@vger.kernel.org, 
	linusw@kernel.org, brgl@kernel.org, vikash.bansal@nxp.com, priyanka.jain@nxp.com, 
	aman.kumarpandey@nxp.com
Subject: Re: [RFC PATCH 7/7] gpio: p3h2x4x: add GPIO expander for the NXP
 P3H2x4x I3C hub
Message-ID: <atW-DIGEbPMW4vY_@monoceros>
References: <20261016164625.3166779-1-lakshay.piplani@nxp.com>
 <20261016164625.3166779-8-lakshay.piplani@nxp.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rb2hybyhnj2upzg7"
Content-Disposition: inline
In-Reply-To: <20261016164625.3166779-8-lakshay.piplani@nxp.com>


--rb2hybyhnj2upzg7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [RFC PATCH 7/7] gpio: p3h2x4x: add GPIO expander for the NXP
 P3H2x4x I3C hub
MIME-Version: 1.0

On Fri, Oct 16, 2026 at 10:16:25PM +0530, Lakshay Piplani wrote:
> +#include <linux/mod_devicetable.h>

Please drop this header, <linux/platform_device.h> is enough to provide
platform_device_id without pulling in a plethora of unneeded
dependencies.

Best regards
Uwe

--rb2hybyhnj2upzg7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrVvlsACgkQj4D7WH0S
/k7KdAf/Ymzfd5nUPGqul10/xb4Cdg8JZlVZwryGIATK15e0B7YEMqJyc+hQaVMu
eVcZr42PEqPgIQlp1aDk2O+1SmuueV/EGkusU0B9jbFL4MYGYDMMX3UXgF93KsHG
L5AztXgy413yo0IWCUZnXqXMjtPSAAOAoJu+9N7VxfWfo4fHLGbZ3AlVffRgev+8
xFFzFPpPNgKNtO2wVYNE3H6K4gKwRMAU3asXySiV/XcnJWZxXoUndsDMpTVn79Wi
kj+JHMF5D/GsSqgsCzVzMNmX4GaziZzgo8BjgIwrbg9TqDEp3zH6reKg55CGXpeD
b49quyvlvKA2UBjz28ZWXDZ7/kEYSA==
=X5cp
-----END PGP SIGNATURE-----

--rb2hybyhnj2upzg7--
