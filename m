Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795033954;
	b=vQBnJe9U03WEe6ONr8HxMRI91K/ghTKAxssCiThZawT/pr8s3eKf+Jawg+0JP2UgGLQ1
	 cF04LeGnZOjLUKUVxMbJsTcGj2u12H6HWeshD+yVckutNKGZxxzks3zIf0gxDB/NW6dSe
	 vmjGzVo5F/Td0OpO96Ui1hyMPQLCesOqhT/4uHGdshXSGdDtNblOm5k/367BXhTznp8x9
	 OKhiQ52baIyjUpS5bkj2I8MAPPHF3zyLWSch8Q0/AZUECe9wIZ0eYpBFBux5cwQiaWsRH
	 frIlAScWeRHXCwR8rtH7962pBDYpsujyaHOwqss8g08/oqxCEOqZI7x+yg/l/6vWiVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795033954;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=pGpLdb5gpDH1q/lbCHvkH2QZ8VkIM3M73qtVnlaA1S4=;
	b=i3X+SkqKqJO2rs3a1TaLFHtoLzVfjE76a3nKr8N1C3Zmng3cp/2pFP/S9WMbKLIGgRnU
	 CfbDx6dpM3hOr5rmClbVLKvyas3K9thZbqomxy/JUc7aFZdAG6IKJ1GcH1l/xmNPv21SW
	 OLUfylicTTU+XX6DrjO4VC5QC76xuWOzYfUEI+mzqN2KJj9iXfhzN5HNjRfVSOCAKpYu3
	 wYy3MnudPfteQ71x50TMrE2Jpcp/0bDutWhscSCHTfhU00Xaqn3pNQ3TgQzK7GF3qKirk
	 B9cSsayyvu8HZTpIWzATi+rJ1mJjAXZXNZd095DhGrCyb4lZq/Khs1y3lUdYNmY0JXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OXhxVe+t;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CA4606A320;
	Wed, 18 Nov 2026 20:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OXhxVe+t
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1734F1F000C4;
	Wed, 18 Nov 2026 20:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795033954;
	bh=pGpLdb5gpDH1q/lbCHvkH2QZ8VkIM3M73qtVnlaA1S4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OXhxVe+tRpWy+neZ4/JusyIIL0FmKk+grrKbtY7gYcfwZvNir+3zYm6fopyUwtGzM
	 TdCvK/ZBqetDVlakNPx1uQadLinBNsCdrgR5kXuAjDA483TPcNuTFqIMvzFj4O7Ib2
	 V+SSi6/hzGYYCLcJF9mtsuG4kub9LbaJALS0TnCxrpKGnIxRxQJd1KYP6sFj1GAf3F
	 zT0tiDFBSL9j/2D0+bkOnuX/+/aASQhXhFIzls0RKsjR3R2vSS6lsfZtoLlrnLMTPS
	 BbfBreOnZD6nbYtLlCni2DK/E+SgdqItoCiB/QOSr3o6Ww3MzqzE+TASUIWMPH3APu
	 FNaoKoLPDblUQ==
Date: Wed, 18 Nov 2026 20:32:30 +0000
From: Lee Jones <lee@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] mfd: convert to subsys_platform_driver()
Message-ID: <20261118203230.GK98456@joneslee-macbookpro.roam.internal>
References: <20261106-mfd-subsys-v1-0-1c3e755d37a6@redhat.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261106-mfd-subsys-v1-0-1c3e755d37a6@redhat.com>

On Fri, 06 Nov 2026, Brian Masney wrote:

> Reduce boilerplate code in these drivers and convert them over to use
> the macro subsys_platform_driver().
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
> Brian Masney (2):
>       mfd: qcom-pm8xxx: convert to subsys_platform_driver()
>       mfd: tps65911-comparator: convert to subsys_platform_driver()
> 
>  drivers/mfd/qcom-pm8xxx.c         | 12 +-----------
>  drivers/mfd/tps65911-comparator.c | 12 +-----------
>  2 files changed, 2 insertions(+), 22 deletions(-)
> ---
> base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
> base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> change-id: 20261106-mfd-subsys-63dc5bb82f83

Looks like you were beaten to it.

Please rebase and see if these issues still exist.

-- 
Lee Jones
