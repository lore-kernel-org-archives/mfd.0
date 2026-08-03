Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54CF36826B
	for <mfd@lists.linux.dev>; Mon,  3 Aug 2026 16:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785773295; cv=none; b=lPZE5jdpcf8XjQp0ken+14hKrTg4QmH5M+7PEgnU7kA0zYOQxBAyoo+kweeUUy4+UVFrD3L4i/Wvu4ILXM9gVCFrjEOTPDea+ca11/YMp21c/SRs+KdFFxLmHxjtNb/7J5+Vjguklfq0L077ddvZvTuszHADp3j+OeeMHJkW+x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785773295; c=relaxed/simple;
	bh=CE+Rv9tsvaQNBvKMuks5uLhestHFeRNrtIdEPutadWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Yscq+sYaBj8EQsIFwHfEIbf4uloTi+5TgDiI8FKJsyUQ8+fpOPkRcuWY7+toce7dj7xSCs3e5HX41H6MV+J+MsOwQAjrBwCiBJRP7QmTxAFRZkEVrac+sInSt0hMnfowlxFLHyqTLet85uZq7/jcEwFXoSjx579Np2V28PNjO5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E1gaXDP3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E1gaXDP3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785773289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yzNObcpGyl7mZyEhQjY56czCyqHDIauV1aLv/H0dJ3g=;
	b=E1gaXDP3bMN3F+HnUOG7LA+MmNVeIhbxjbbgaYXAjerSoBoTVMvyYVzM36tVQNp2QFxyyr
	7W8rThwE6uP7mRb5rM0Qpva7cUFF7P/f0iVEwan0lVcD31j2BcP05ENvVtMeq0FhQ+H2Uk
	+JQ/p61LMtdVEi2ytnG2fjKTYpzby3A=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-152-ehHECWIDMxKyj3BX2PnQ0w-1; Mon, 03 Aug 2026 12:08:07 -0400
X-MC-Unique: ehHECWIDMxKyj3BX2PnQ0w-1
X-Mimecast-MFC-AGG-ID: ehHECWIDMxKyj3BX2PnQ0w_1785773287
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-81f8ba7885eso5151367b3.2
        for <mfd@lists.linux.dev>; Mon, 03 Aug 2026 09:08:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785773287; x=1786378087;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yzNObcpGyl7mZyEhQjY56czCyqHDIauV1aLv/H0dJ3g=;
        b=CUvHX1DgHZ7Q3kCzlBUa7uEZYvgQrgJaDQfrYR5XuZe5c4VBj2AH39vOYDWCtIAJyV
         QjkUH/hSbIIOPn43EYJSagW9qDhj6yL6zsF09Aumj6x6S8jijlXtJpr0itQ7MXLNmbe8
         OZlHrBnXf5z0U0c9lOZVIC/vYXmobJ+edwnkMBXeykaao8oWqSwDAKA+wkr6/QHBH2hY
         TmgpTyGg+RcDjB4wNQiUYoRqR7X9Tk/9IZwjiYsMGP7oKtCNx1ztHpPeO1fRJcGvMoa4
         f8UuSK+KZ9jExE1jqYN3bKQY+KA8pvSJB/TgbJtCpj8S+CMbZd4msC5ASbRdVC3AkmsH
         eMpQ==
X-Forwarded-Encrypted: i=1; AHgh+Rov6ebtxPXUryAIMduCFO4QgWLpCzt/XFkfPb94QkXWdR6mUKntldZlCLKw8aLEl9Yo5Ok=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyn4Pgb/hSC8FJ5fMWlYC434vzzgzenaBB0CDT2a573azX1oCGB
	Vpox1wwaZ3kBdi/HlTpuGQxDMktJ4unWSFmflXJ6HR5iIDEMBf5pjInQulCOrNKyr8f+jPynrBO
	aRrF0Il7viEPrqPTqT91dDT2PZDG6ts8imZLaEevEYpnc5NSNy6LpAg==
X-Gm-Gg: AR+sD13jZs5AZD6xF0A9EybYODVpLQNKwmivVZkb+c59E390RMrdvsmcwLVHKYjqVY4
	8bmJKv/zOqk1nYbFa9VtznYR8NnyOVbkJgQbpegvtTDeQ1gyw1oLic1bgbJBCg7OrwGvoHv0e7i
	Ao6tQyeo9/cSDGzyg0n+g+TSC4knGORYB/unXbcyOFHuNI2YFTVXBcLadgRq94u+jC9uyrOgvCn
	zyOJkVcC5GpldS67Td2MWiTV1KUbD5IWn+f5U7lmC8/D7QSx0PT/tl5U95J4p+K3g3W5JygLr56
	Knl3eHfSdgSm6X6R4LoILrrX1gKt0m4WYhVXxw6DiqcklbbghUFDEyuUdwvd1gCeQVinhi8sHCL
	nkGnfYtRHx/sdh83XTq1hi6rn/vxKgio5kMY=
X-Received: by 2002:a05:690c:670f:b0:81e:6bd6:39a5 with SMTP id 00721157ae682-81fd49c95f9mr134145257b3.1.1785773286882;
        Mon, 03 Aug 2026 09:08:06 -0700 (PDT)
X-Received: by 2002:a05:690c:670f:b0:81e:6bd6:39a5 with SMTP id 00721157ae682-81fd49c95f9mr134144907b3.1.1785773286508;
        Mon, 03 Aug 2026 09:08:06 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fcd123dacsm57310617b3.39.2026.08.03.09.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 09:08:05 -0700 (PDT)
Date: Mon, 3 Aug 2026 12:08:03 -0400
From: Brian Masney <bmasney@redhat.com>
To: Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org, mfd@lists.linux.dev
Subject: Re: [PATCH v9 06/12] clk: zte: Add regmap-based clocks
Message-ID: <anC844zWjrph3KlX@redhat.com>
References: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
 <20260802-zx29clk-v9-6-d05530d85d28@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260802-zx29clk-v9-6-d05530d85d28@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xvUmu5SevNuQryud2oeJBA8GtNjzphHMvn4UHkcd9MQ_1785773287
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sun, Aug 02, 2026 at 11:33:38PM +0300, Stefan Dösinger wrote:
> This is based on meson/clk-regmap.c, although slightly simplified. I
> have kept the copyright lines at the top of the file to indicate its
> origin.
> 
> I see that numerous clock drivers have their own incarnation of regmap-
> based mux/div/gate clocks. If there is any version of it that is likely
> to be elevated to shared code like clk-gate.c I'll copy that and try to
> use it as unmodified as possible.

This second paragraph doesn't have to go in the commit log and can go
below the ---. Otherwise looks fine.

> 
> Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

