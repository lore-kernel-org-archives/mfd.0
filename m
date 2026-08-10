Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9624C3B3C08
	for <mfd@lists.linux.dev>; Mon, 10 Aug 2026 21:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786398483; cv=none; b=mKnoTwiqs918mBqJSSqgASP6VMEOIPg0KF8JNyPVTKsxQawROI8Vg9Oru3crL3/oDKzCyeMcM+HEH5uofluzmUpxJCshiDmURibgsHIAK6fowHXuVjOkjP/EHR5mNB/vrir71jZMUUwidldwJdfVcg7/ersCSYbY2WWDNeJ+7k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786398483; c=relaxed/simple;
	bh=LrsqqfM5Lf8SduY5JVzHWp4E8K081478dAwhdzwG6Gs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=sXJW57MzZYFmFy/iUlH1A97JtbQyMKgSplA47adc9/e/eEFQ5vfGcYMNm223jE4/SdCOQ3QQyZBiJiv0IWCq8Q/9cBVEcWE1zhFVuk8Ax0Z8XEN6iwUQvCb6oMK68Vac1gAficP5ob2vHqq8u3MhNM1fN+R+BEQXTUyr3QqTnjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M/4bcMqP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M/4bcMqP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786398480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u2kNjc7BvbeCZjQXT/CDfqSPqzNq93GXaL2zxjFnbUA=;
	b=M/4bcMqPvE7OTFoPT7WmXs0MeNP6AZqxeJhNU9GB9sWGe1BgsHp6xoPuRzt8Q8W1TsTm2U
	XouBN8IXRdKCfsN9dGlOKsHT1mcEuj7ToTqO5MaVLWDLFIREp6wm5tvXUzAf9YFHaSMGJU
	ZjRh3eSRhXzzkZqgdvkE1sXO0gcuBds=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-438-ActITt74OlijK93dqvCjJg-1; Mon, 10 Aug 2026 17:47:59 -0400
X-MC-Unique: ActITt74OlijK93dqvCjJg-1
X-Mimecast-MFC-AGG-ID: ActITt74OlijK93dqvCjJg_1786398478
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-81e735bcceaso38599207b3.3
        for <mfd@lists.linux.dev>; Mon, 10 Aug 2026 14:47:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786398478; x=1787003278;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u2kNjc7BvbeCZjQXT/CDfqSPqzNq93GXaL2zxjFnbUA=;
        b=BLNgg4hd3ZP8pBAYojrw9YBaIC21kdKD97IBNHBBFg0rigSP7TwztBGpp0VtPzL282
         2v4866vwRYHnEu84qDlIhp4iYCPFZsR2BgKZXJcFXFplP8sP46nj/8FzloOOObXLjBbZ
         /qio1aXvLngfgW3Z69uMmdPKpRzt5xvjP6FzKea89fe9aQ8Kx0rSMNiq7WYepYGu1L58
         5W56fsbuTdDPADLvyuAOqEuon0cKogj8rd5uh1245yvjRVRiIVLRmHQ+BqXJmn+35G3w
         KB61axG8gkHg53AjneItHz9GbPb0yF3+ONQ7yco4bzZzvEY5SM4rux1nNIMTNjR7HoXu
         POKQ==
X-Forwarded-Encrypted: i=1; AHgh+RrSrH3zRw11HhOQqy86VVTmveAn0AE88vttKxDmCyus1KNqE/GFt/o2ddzCQIWtdvSIrNs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw78s9Xwsh49bPB8EU/kdFPhTysxpT7eqVe6htTsi5BOHW5oaDe
	6jQEeLClhiWG2dIwTJ9nkOCI7PX3feHAS+btyZn/DVY1/5ZuWiBHwR4209kZKFNOI9Lcd1foy7W
	7vLsBX2or10wM61wWnKdayoL0YEmDdfHx7pj0AgglBSeGc/jZTNHjog==
X-Gm-Gg: AR+sD10CdGKApsjgE/DkCyGg5v8ktKo0H7DvvwmNDWHm1LYbNaSnnSvGNjw1hk2e4BI
	t3EesQx9lpr873e8vJou/XMPXAhmiiDBNVPWzkIHUlp2Madf92Nt7l/2aZQf5k14U/3l/iC4eq7
	NGiSG0WY0D0H/5E8uj7Fqho9625fCXolctvPV+8SZsDsuQ0HT8OHw49UUtLm+/XU3sLSTzQFW8/
	KduC7TPFyqNC4bI2BY2XQ0kBePATw9sLjVS/fJKAIQmiTCgF2+eZK9lRXkLy5dQ9z0IK5TCajkg
	tmFQ8lmsQ7guBXdnsC6iCyz/mtwm5MQYsmO3NB4Vk3diBBWuQP35DqvmwSW4kXZ00WfOo+spUIY
	gfCfDf9XWxW21t3JSwi6IUCkkXTN/xwMhX0U=
X-Received: by 2002:a05:690c:9989:b0:81e:4e5d:484a with SMTP id 00721157ae682-8243fdf211amr161873617b3.2.1786398478520;
        Mon, 10 Aug 2026 14:47:58 -0700 (PDT)
X-Received: by 2002:a05:690c:9989:b0:81e:4e5d:484a with SMTP id 00721157ae682-8243fdf211amr161873217b3.2.1786398478040;
        Mon, 10 Aug 2026 14:47:58 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-823f577c580sm64586967b3.27.2026.08.10.14.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 14:47:57 -0700 (PDT)
Date: Mon, 10 Aug 2026 17:47:54 -0400
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
Subject: Re: [PATCH v10 05/12] clk: zte: Add Clock registration infrastructure
Message-ID: <anpHCvLCm1JKImC_@redhat.com>
References: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
 <20260810-zx29clk-v10-5-63846490712c@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260810-zx29clk-v10-5-63846490712c@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mkDqfntqqhYGZ6POoNNigaynCpFoNB2z4EHWlVQxU9k_1786398478
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Aug 10, 2026 at 12:28:24AM +0300, Stefan Dösinger wrote:
> The next patches will implement the regmap clocks and PLL driver. The
> actual hardware specific clock listing will live in a separate module.
> 
> Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

