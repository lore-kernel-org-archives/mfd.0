Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9586535201B
	for <mfd@lists.linux.dev>; Mon,  3 Aug 2026 16:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785773136; cv=none; b=fdp3xJ+18yFhnju1yN3K0446YniHw9BY5iKbX+6bzBbEgH5QeRMGjNNotMpHjbO/BqckvKj1iLtMnkK1B0iPGK2Ca6i1wpvDFUMzryKp06vLM6bLqRvH3ga4YATxih9Lgl+Io+RaxYMZYvhp6xe1jR5A5knzltMDUbyoSzfNn8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785773136; c=relaxed/simple;
	bh=jjmdBTOcGsvvUEbiWQaxptxR3fZBHNirFhVPTnjc2vU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=UuwJTx9k65is33c8UYMgaDuBGymGvdeYaWwgfQNIpsGKY+Gk4S163hi1lllpTw876AmOmGyg2uxcANgpjnH+5tV/bV5ywvqZSM0rTEYUEGUwU3k2tfYgqlRAFZJvBLC3KI1i2wdLiT/CyhFnBr3bM5FdV9I6hOs1aJmBZZ7ZFDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IvCuQrHN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IvCuQrHN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785773133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=357lP/N3j9Pe8409LQo6pgh/hm23lTt1qCsWKe9kpVU=;
	b=IvCuQrHNqAxukO5AaQ6Avure5gpxAfZk4Bnvrkk357CPjv0zG25eC9/nGQVSt+ZVwFAkGe
	slxHSKTZqtf9ZcDcUJ5KJrZprfPtO7NpbyhMWHkWPnAtx3wsvj+cGjd3uZhIMZhenD8zwh
	DxCRKQiNeLHalW9lDU+4NiExkcEhi50=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-OhEx4-dYNsu3FM4nDa_2-g-1; Mon, 03 Aug 2026 12:05:31 -0400
X-MC-Unique: OhEx4-dYNsu3FM4nDa_2-g-1
X-Mimecast-MFC-AGG-ID: OhEx4-dYNsu3FM4nDa_2-g_1785773131
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7f5b54da461so59224377b3.3
        for <mfd@lists.linux.dev>; Mon, 03 Aug 2026 09:05:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785773131; x=1786377931;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=357lP/N3j9Pe8409LQo6pgh/hm23lTt1qCsWKe9kpVU=;
        b=qls7aeRHhG8pcP+zlVWGqR61IXjpXFQd/Y698AEr0EBHQX8HxzZKUdqukh2IMM+vgp
         8QIojsdm6tRnqRRjolMJUsxl/ps3R5+657pkz9ELgm0367EPAflUMe1314eb4gV6E7Qn
         O2LzBkmQ6tHmpXC5Wt9hGquHV6eqPL5tboes+dyUYTxN8xvnfuSqUUuLAkHSNLPzD7un
         yWg8zTktO0Rl5d+mmlfj93yPy3C02oVqrps6/YIAgoPbRtRyP/2eIERhr1sAILOFkv8m
         PNG49v5px2JpUOf3IfMYjoj0Swx1MoQUmumSflyxpduX41gJaBkv/9bvSuaIEgAUm289
         /maQ==
X-Forwarded-Encrypted: i=1; AHgh+RqYO7gSzBa97mTGku6CZpdJ369HK7rxDzY9RPGNun6xcX4Z5dV554n+UfSGx4yrDYCoTYg=@lists.linux.dev
X-Gm-Message-State: AOJu0YybaqSo6U5U2V4/rVdjFTDgV0ui1AQTXmCKOzRXV0TTrNqSh+uA
	fj7rm5fFzpIh42LT4xSJtopzuC8Ifv3o5VIrGUA+EcmbxZ8M3GxgBQrf25Ysvi721fQ6vJDVLWP
	QMlXna48yNcmit9hUsr2DaLx5GH1b8RerK+VW6Bf13uwTiDB70Vzabg==
X-Gm-Gg: AR+sD12WVam2awHDI2ekvL0Lx3JGJmKLl1wkPcEGbLuv0sz09iCVQkV5bAYUX6DHuZE
	bYb1Mw8z0ECWNvItZAo1x34hQHsrSXKMu44WdOf3NdKJwV5PpLEMpSAFC9JIPm7CFlX2/Dsfz48
	lxxq737tNay5sc9YrGq9vmV+eQDKoEfErMCAfFJvWloJMlkVnopCRV6ldysEcyX2oU8QALrey5L
	L5tgBlWE6te887VR+WuG3Hy9mGnBSGAAV8Xurk631ruXWIvVYuia/80otJcF1x1h8XxDnaDMAuO
	BzwqdOK1E5hl6XbzsvpNciwKRbYH5acnxK58cQEpIDqfOaXoj63Jvb//ka9tISUjEaAcG4ltLGt
	lyT2bP7gdHzkHGFQLjJFlr3iegojildzx/Uw=
X-Received: by 2002:a05:690c:6f04:b0:80c:ebd4:762 with SMTP id 00721157ae682-81fd49b4b80mr130783447b3.7.1785773130745;
        Mon, 03 Aug 2026 09:05:30 -0700 (PDT)
X-Received: by 2002:a05:690c:6f04:b0:80c:ebd4:762 with SMTP id 00721157ae682-81fd49b4b80mr130782967b3.7.1785773130388;
        Mon, 03 Aug 2026 09:05:30 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fccf30319sm57712047b3.6.2026.08.03.09.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 09:05:29 -0700 (PDT)
Date: Mon, 3 Aug 2026 12:05:27 -0400
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
Subject: Re: [PATCH v9 05/12] clk: zte: Add Clock registration infrastructure
Message-ID: <anC8R2Nxgv_w7Ahp@redhat.com>
References: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
 <20260802-zx29clk-v9-5-d05530d85d28@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260802-zx29clk-v9-5-d05530d85d28@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 02IDysMVVvv882CQNfb9qFiJyjrfuj9SeG_sM35My-0_1785773131
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sun, Aug 02, 2026 at 11:33:37PM +0300, Stefan Dösinger wrote:
> diff --git a/drivers/clk/zte/clk-zx.h b/drivers/clk/zte/clk-zx.h
> new file mode 100644
> index 000000000000..175fbba3e0b3
> --- /dev/null
> +++ b/drivers/clk/zte/clk-zx.h
> @@ -0,0 +1,142 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2026 Stefan Dösinger
> + */
> +
> +#ifndef __DRV_CLK_ZX_H
> +#define __DRV_CLK_ZX_H
> +
> +#include <linux/clk-provider.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/types.h>
> +
> +#define CLK_ZX_PLL_PREPARE_IS_ENABLE	1
> +#define CLK_ZX_MAX_PARENTS		8
> +
> +enum zx_parent_type {
> +	ZX_PARENT_FW,
> +	ZX_PARENT_ID,
> +};
> +
> +struct zx_parent_desc {
> +	enum zx_parent_type		type;
> +	union {
> +		const char		*fw_name;
> +		unsigned int		id;
> +	};
> +};
> +
> +#define PARENT_FW(_name) { .type = ZX_PARENT_FW, .fw_name = (_name) }
> +
> +#define PARENT_ID(_id) { .type = ZX_PARENT_ID, .id = (_id) }
> +
> +static inline struct clk_parent_data zx_get_parent(const struct zx_parent_desc *p,
> +						   struct clk_hw * const *clocks)
> +{
> +	struct clk_parent_data ret = {};
> +
> +	switch (p->type) {
> +	case ZX_PARENT_FW:
> +		ret.fw_name = p->fw_name;
> +		ret.index = -1;
> +		return ret;
> +
> +	case ZX_PARENT_ID:
> +		ret.hw = clocks[p->id];
> +		ret.index = -1;
> +		return ret;
> +	};

Stray semicolon

Brian

