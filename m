Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793118889;
	b=25nTAJF6aVcEZ5hmrE94jIv6T4YP5uSng8lF24yChnMuOqUyeVJWsTn4rpGD13JejbuY
	 6FpXzhiC7waPRxj9C9e+Ku0g0kScQKDtvwZa0Ga9finL+UMKJlI6MW2YDjrRYpSfKRZTE
	 zV3RPwAjEP6XbQu/PmKhKx+vQ+jsOk/bNrVrdtndDM8jqOAZjaK9G8m/eIWGO4jkMuPCE
	 3akA3z95H0tmuNuPAG+PXHtm/bjqlU2CJjgVCbmUahzOGCFwoQact9ZWAtOUntA0xIgz+
	 oDoHo1tIdiJeHaHM6r0FzXbO94Sct74e3pg5hif5ZhOsbtFgW+9eCmAjDMm6gyi02nA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793118889;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=JTCbAAzicyeiiqXynNzoLkl9gYn7zDPQJlAnzkNb7CY=;
	b=y550mpqaVgCc6JrRqyTWO+A47A7yL6Y7waDWD9A+hAREcQxwzWmxvT0PLq346y9yDL68
	 i6uawB/WUsYzVhCaAius8ARwvX3J2LeD5JXZoNEuk+RsfSNoQU4itzlJUVgYlGD0hu14f
	 x1ZUJPz9AFs+jucA8F/Mpgi+U79XhHFDD7GspqU/3fXd0Pd9ZzyiLrlGw9Y/DKkNLGGCH
	 zyGXpeM4Lx2bFqQmF31P/t5q3Wn5IK9clgL8soQF39RvHGh3KbhfYhhUXom/R7A50dCWT
	 W/34JLWadTHkPT5uAw5uL3nWbWsWQu/5cJuhRegK8suFA9VFhrR86D72z597udReNnQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OuTi6M7L;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0E3606A320
	for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 16:34:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D0E3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OuTi6M7L
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-6798eb0d13fso78823d50.0
        for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 09:34:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793118888; cv=none;
        d=google.com; s=arc-20260327;
        b=D3JGx6DbGCGasbCoO0lAwpUCJ/0rQ4qj2hIJoUxR+Pm+tgeX2GOzLkmFaSA4i/I0cK
         jkG6wtRB2B3tpIZh3RLXMzU53lbiWtemgK6dAtXcpnCvd+CLlx2QwbazJmrhEXP8nfVQ
         tqQdZuMExqBkTpYW6utTlU3DT0ovgvcK8IkA76dA1BCxbDHJyasoWCYzQJbJYyAH0dLF
         CNxNyfCDx5v36ltu2mmTYlmFuEwdd4k4JXyTL7jFRK9QBjU35W6KFtwflGZefm54Sxkf
         22pZdzmINbbnpEvod/QmJmXSMYz0o8ctcJZtztVEgQJw66HAcBCSxoH94/dXkdLIvKa6
         rMRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JTCbAAzicyeiiqXynNzoLkl9gYn7zDPQJlAnzkNb7CY=;
        fh=QGVUFzGPLcB+Hp92sTg49BO4pLc8Sr/onO1qBy6sZSc=;
        b=nNcQGjmRr4H2MuTnJslQn9t25AGYeM5WsTR3G5vbcrnsuqeYdJNbs6hGz5DRkuJ255
         h3nRvT8CWBjzkvMYE60LBEPRwWq3abqtGFpg6FtO3oqqycniQ1rJRkG20JE3zXzV3ggl
         70fl3JFojQuq5MLPmeBbw7IXnP5+t9QQLuz5ZqDS81OjyesEJpi3SYe59dg1QfYwuzdA
         50Xa29c/eYN9mwQb9qCJu7Zr/0Lf3jRZYRIt39w+o6jFkXq6tW8OFJf9Ky7mpQIRIjju
         Zf54MhRyVfZr4Z2vg0xeNH3z8M4WGb4fPhSshP29O2jbrEo+CD7QvgU5kNyk0J65vx75
         vh0A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793118888; x=1793723688; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JTCbAAzicyeiiqXynNzoLkl9gYn7zDPQJlAnzkNb7CY=;
        b=OuTi6M7L0fYshL/fPcLrLt7ywKl07FLOuYSfsuJmo0q8VxqqIiUNvZqfdgCCll39D0
         ioa2lnSNWrMjtu0+tVzVVseqaKguyttPLS9pDLmOHXzbVJvJAOerdFEbdxKy8PXpByH4
         9diHy6NxtG7cGAU16p8nHAAs4jzbnvyL5EA76gn6FoPRiP9OiEHgOAiRrdBZeKbwM6sQ
         Hv4IZeyRXrOfUsLBqLnVbeseE/uPiQmcoHJWwR1Y8ity1eQNZtWPekHh69hgYCpcV/mI
         FwLWOqJxXHmnrCvs7dTqvdnMHTvmzI3d8xuRAbEhhIrKuvtd8pLx8Sg1w80JkskEmEEV
         PnQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793118888; x=1793723688;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JTCbAAzicyeiiqXynNzoLkl9gYn7zDPQJlAnzkNb7CY=;
        b=QnlVlz2/lf2Rp0iylwws0kGFjvX+c+2L2YkJAM6CTGOFvmSgCfOr9icm7m2ybU++Ok
         xy9VkL94mE3W6LHmz7TqThv1QIl2iYGLiYNbTaQ89Gu+aJ0Ke8WKM3oukTuPRNmBnnvj
         JvjJC9LgI6yfVvxRWD2pNvFE4ikIhomYLKLFnDC41ZqBKVw2uwFOv9yrGIgqHN60QuvW
         22YOwnmEa5jBmclxka9Z/l8b9hEc/QoBRsOv56RbcoX4x4gX7i3nVlHFv6UJbwEspYBE
         o20VQBi4iCfubnMTb4TTZXOhznenEPoX2ROp1IsPDtjdzsFTSg/gQvUa9epTDBm17PIe
         A1MA==
X-Forwarded-Encrypted: i=1; AKwUvBwZcHS8LQoWoDQxoAKMRVpJY2+SvZRtM6HRH418dsr3GeWIuqgoGV16qk29AzctjZ6D1dY=@lists.linux.dev
X-Gm-Message-State: AFq9FYJqwFJBFwXgj01Bs+ezLVbcVhuO6VjdtPPPhcPb+t8P/Za+tas7
	QGPsFo3M9yDQOLQIT0DKBTGRYR0QC8DjoFPj/P/7y1BjxDIwj5nOW9A7La+Qqb3zSeLh1gSEBrd
	44hEgm7ootOvVbubhoKYbKBH31LLXzaY=
X-Gm-Gg: AYBFou2jUR3OhP/FCv1FsM0FrQEJmnltQm/NsuuHvzUX8uFuYC+JjHpLgfwM1J8Fpwk
	ZHyQY3yJp6V7Dsl2PnDrrC+cdtJaP4W5yngRwD05fq/4Xow0CVXAG6sDlcsOoU4/GGzGEWiUVEg
	Na2b2hVaX60y4PE7mGt2CReV8OyFbYX4bQsvfnRdClZQuLWozLxQ3NcSFz4hvqvXdkaL73ZqgDn
	x5WRrUzsDqboeNiAm3XBqsPsjDiQxsySD8IakwAByeMOZ2Hq7j0Oa58wufg3HdD+u3DkJU1lDTB
	ZAxFmJw6pIgwRFttS9ug/+7Z/Zzxgv9+YZFTBryM6VqT+rUnOku5LdWdVC7zjIq5T79thtltWf5
	bbjyk2vYF2DiwSbXnortk7KeRvHdzsqeiLGe6
X-Received: by 2002:a53:d707:0:b0:677:cb43:4b3a with SMTP id
 956f58d0204a3-67a7bd688afmr23659d50.156.1793118888025; Tue, 27 Oct 2026
 09:34:48 -0700 (PDT)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261027024609.117371-1-lgs201920130244@gmail.com> <20261027162457.GJ2195460@google.com>
In-Reply-To: <20261027162457.GJ2195460@google.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 28 Oct 2026 00:34:37 +0800
X-Gm-Features: AclHuK9F4Xh0ot3RGPhOyFM6lJKMyY_HosbzQTq8lFgxlR4gfFrqEYjNzCwXBj8
Message-ID: <CANUHTR-3nyHpBgEBA0wyPwMejK0WM-4yveENGZwV8wvkJbBwCg@mail.gmail.com>
Subject: Re: [PATCH] mfd: hi655x-pmic: fix IRQ action memory leak on removal
To: Lee Jones <lee@kernel.org>
Cc: John Stultz <john.stultz@linaro.org>, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Lee,

Thank you for your suggestion.

On Wed, 28 Oct 2026 at 00:25, Lee Jones <lee@kernel.org> wrote:
>
> On Tue, 27 Oct 2026, Guangshuo Li wrote:
>
> > hi655x_pmic_remove() currently removes the regmap IRQ chip before
> > removing the MFD child devices. regmap_del_irq_chip() disposes the
> > child IRQ mappings and removes their IRQ descriptors.
> >
> > The hi65xx-powerkey child registers interrupt handlers using
> > devm_request_any_context_irq(). During child device removal, the
> > device-managed cleanup calls free_irq(), but the corresponding IRQ
> > descriptors are no longer available. As a result, the allocated
> > struct irqaction objects referenced by irq_desc->action are not
> > freed, causing a memory leak.
> >
> > Remove the MFD child devices first, allowing their device-managed
> > IRQ handlers to be released while the IRQ mappings are still valid.
> > Then remove the regmap IRQ chip and its IRQ domain.
> >
> > This issue was found by our static analysis tool under development.
> >
> > Fixes: eb10245fb37e ("mfd: hi655x-pmic: Add powerkey device to hi655x PMIC driver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
> >  drivers/mfd/hi655x-pmic.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/mfd/hi655x-pmic.c b/drivers/mfd/hi655x-pmic.c
> > index 5cb392892c19..3a7ccc9d30b7 100644
> > --- a/drivers/mfd/hi655x-pmic.c
> > +++ b/drivers/mfd/hi655x-pmic.c
> > @@ -147,8 +147,8 @@ static void hi655x_pmic_remove(struct platform_device *pdev)
> >  {
> >       struct hi655x_pmic *pmic = platform_get_drvdata(pdev);
> >
> > -     regmap_del_irq_chip(gpiod_to_irq(pmic->gpio), pmic->irq_data);
> >       mfd_remove_devices(&pdev->dev);
> > +     regmap_del_irq_chip(gpiod_to_irq(pmic->gpio), pmic->irq_data);
>
> What about devm_regmap_add_irq_chip() and devm_mfd_*()?
>
> >  }
> >
> >  static const struct of_device_id hi655x_pmic_match[] = {
> > --
> > 2.43.0
> >
>
> --
> Lee Jones

I agree that using devm_regmap_add_irq_chip() and
devm_mfd_add_devices() would be a cleaner and more appropriate
approach, as it would allow the resource cleanup order to be managed
automatically.

I'll look into this approach and update the patch accordingly.

Thanks again for your guidance.

Best regards,
Guangshuo Li
