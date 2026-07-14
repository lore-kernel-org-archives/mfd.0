Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C07235358
	for <mfd@lists.linux.dev>; Wed, 15 Jul 2026 08:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784102481; cv=none; b=DrTv3SrEFSkRaW0V+BtOBq3tgO4p3hEgvnn8edRWZmTQ7LBV2AB885urf+4qG77BKJCoy6eQViyXANq7/RzZegV0k8/dk6I2NWH85FafJAvNzCPttN+5zRaPxSQekczcwtmyRwjh7Cd/BjjnXTQ9q86RG+S9fTZ6lWYXV24J0K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784102481; c=relaxed/simple;
	bh=HSrqo3rPcHBi8CgB9LxOsFM4lZo+LcatZQj6Ixlc4p4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HYutG5ZCgysJdR/34vSAlgeIi2oDhe/XK79n5qyybd9Y9Q+fOPJRby24QwKQ1DgpAZYaEW14HGkM3KQYyF6TbfzAnGsw2ZaxI6FthLZJMLJOrJjSqPKMwINo45G0kB34QL3AqvNwbPWA2Suq7DA4qX/XEVsVk/LL3xuJLn7PSQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=Mblw/snt; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="Mblw/snt"
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <andreas@kemnade.info>)
	id 1wjuX7-00000000JAi-38v1;
	Wed, 15 Jul 2026 09:59:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=N3CkAi0NhBu7kRLp3iC2P9Ehn1eHefsaOWNM8LYTF4k=; t=1784102398; x=1785311998; 
	b=Mblw/sntslM5ewVGvUMkeJKlsTp0Tc0bXkkkNMbH1e28W9w3ctO4CTng8nPHJhvRdwSMgHgs/tp
	SGFt/ng3dSqEwrjzgso+UjhLerR1aXmd+Hs7hE+3iJF0iVHZhLgKj/2TO/Hfs2YwlJ+EPhGSrum1k
	5fP5GnUJ5ontKmMlnWy1ULDILcqXFiYx6Np7rcesGHmE0uZVW6xRfuo3kRJwWtv1WUzM7/qcLmxTQ
	f7zVzsm7GgfDKHlV+OBcl5GPen3joiiDL9m1FhyBCbf/8ZjByt4lqKpmwlp4wpHrWN7PzfmrgT4Uw
	8KjoUv1dS2xV0wFxtY3cXR5brJSJeZW7SQEQ==;
Date: Tue, 14 Jul 2026 20:36:04 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Grond <grond66@riseup.net>, Stefan Leichter <sle85276@gmx.de>, Grazvydas
 Ignotas <notasas@gmail.com>, Tony Lindgren <tony@atomide.com>, Ethan
 Nelson-Moore <enelsonmoore@gmail.com>, Jarkko Nikula
 <jarkko.nikula@bitmer.com>, Sascha Hauer <s.hauer@pengutronix.de>, Lee
 Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>, Roger Quadros
 <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, Daniel Thompson
 <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, Helge Deller
 <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Sen Wang <sen@ti.com>, Richard Fitzgerald
 <rf@opensource.cirrus.com>, Arnd Bergmann <arnd@arndb.de>, Srinivas
 Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, Kuninori Morimoto
 <kuninori.morimoto.gx@renesas.com>, Charles Keepax
 <ckeepax@opensource.cirrus.com>, Niranjan H Y <niranjan.hy@ti.com>,
 letux-kernel@openphoenux.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 kernel@pyra-handheld.com, mfd@lists.linux.dev
Subject: Re: [PATCH 06/16] ASoC: twl4030-codec: Allow setting APLL rate
 through the .set_sysclk() interface
Message-ID: <20260714203549.4b070f72@kemnade.info>
In-Reply-To: <7ea589f951baf1e217c7169ae21c0bf510672ecf.1783749722.git.hns@goldelico.com>
References: <cover.1783749722.git.hns@goldelico.com>
	<7ea589f951baf1e217c7169ae21c0bf510672ecf.1783749722.git.hns@goldelico.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 11 Jul 2026 08:01:53 +0200
"H. Nikolaus Schaller" <hns@goldelico.com> wrote:

> From: Grond <grond66@riseup.net>
> 
> On the Pandora, the APLL is actually what drives all of the audio
> clocks on the board. Since the TWL4030 is only used for capture, we
> need some way of setting the correct rate for playback streams, since
> they will not go through the TWL4030's .hw_params() code path (which
> is normally how APLL rate is set).
> 
> Signed-off-by: Grond <grond66@riseup.net>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>

As a general comment: might we model this as clock provider (and maybe
that enables the usage of a generic audio-graph-card)?

Regards,
Andreas

