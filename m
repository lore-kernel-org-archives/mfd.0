Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794364251;
	b=HD99BOZFcNi5wH7yt+G5LpvYwHrraDg44GwhFairOKJZBarV9hFJI0Cq3/uw3GaDwVYD
	 /5B+H9xu+UZlvbpEDvkPHR5nokqtlB2IEjvQEJO+YMG2Qup8BtMg1AJvzm/GJuC9WESEk
	 yWzBWlNm4sT7S3kO/InQrayBZc7ch8WLI4ZtM5y4oSwD7YZtxvtFm/wq/ml7+2xalmyev
	 7As+4VHogdvarMpnsBZwHaT/KSeYJEpxDjADZg1wNIxBGGPicaJNPyEqbGXAiOO/O7EQ3
	 3mG8m2lFYf1mhgq7w0gFbWvMggETzpyU7a3b0RRQXlBAL4UOwC6bWRSekgxkOMq+ztg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794364251;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=t8BFlEAmJEj8HGxMKTsLsaY7aesl7fSNxoZ8biKmTbE=;
	b=5UiEWgGQN+yd2SuoHqZfSGzrpzoKAtaMCLrC9XeNwjt4jJQXXnJRRNB/Z8qy4mx4JmAF
	 B56p6xj7M6RCQ+e7l2+4E5anHtiRrp6BqMeCIOJ8eOXpvv7kHB60HCzawl6hLomsWw8KE
	 WhsrqOwk/PnTYkek0YL3JY8Er1J0Hup6eHf7w4Pc5oElAUC3Zg+N2XJwZDHJ5IabRSLl9
	 sB7p+zlg8jx6uE5ogSv+oe0kXjZYKCWlCLq86meLXzlVQpmbDosrDcDLKziP4db2ihRT/
	 IQyAdn6QHgYD9r2jkqMVoTXzGCh4C4yeLDQJwzxAPd4kOOmuGiCNvWM1BCl9fyxGaaw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jbe8+gmh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDEA606A31C
	for <mfd@lists.linux.dev>; Wed, 11 Nov 2026 02:30:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BDEA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jbe8+gmh
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b360828905so27912737b3.2
        for <mfd@lists.linux.dev>; Tue, 10 Nov 2026 18:30:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794364250; cv=none;
        d=google.com; s=arc-20260327;
        b=DS0QrBS1RkYlwTHGvzaDr6BqN1znO25uhu+6HLuTnNdtz3DnYe0zsdIHHLTooplES4
         pkE5YZV+UM0MwowIs8Yq7JdadWizjGT0f49LBd2OnO4+KJIy9QpaLkX+B7W5PjgmZGvJ
         R5oVYLMFNNgS23r5LKAC4RUkYeZ2Yfa17CHRIwYGePstxBfNkNZL1IOqWcCOF5+NqlKZ
         jmq2Uph7wBDA5PY2XLxk+fFpvbKgvLYfhoJtwGLcJfrbipWmUUSMuuNc59XCXGZroy9n
         BOnJWhKyZ+pgsnuXlR4lO59yH2U0XO2T7SwypRPkf54W/o86jMR5n19WzZENkE3kwj6A
         WFww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t8BFlEAmJEj8HGxMKTsLsaY7aesl7fSNxoZ8biKmTbE=;
        fh=UBGQfSb+xEAsKFaRsrkr+0JQWls8+YX12p6g00woimM=;
        b=ZDifcFeF24ZzvZmQhCEavP81NQx+ln7A6QqpgW42zZh0fQq97zh53gO3EjMMbrjfBm
         92E+mYD76I3UKFXTYPcIMmTO109gQzekDPZTYxAWHJOC4KDWUZeDS82kV0vBYVJrYPjR
         lg8sCCafvP0/9od5PNDgHHMxSiXCUVKZBENBIoCX3juPBi4HufubUjPIzBJRFUtLbyal
         /Wk3ic1oL5WUOIHbPBEER58PgR/S8ScLqScXVsW74VAffG7SxjBzCX1Pl/mqNrUuSuBl
         H1WD3vhEz1igkskaFepo39tfjzYDdIs9tBMCAAHfCBOmc47ULDycVkjS7OMj4v+yM0XR
         zIrA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794364250; x=1794969050; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t8BFlEAmJEj8HGxMKTsLsaY7aesl7fSNxoZ8biKmTbE=;
        b=jbe8+gmh6EjXHOK4Ishr6edMVSbSe3pQOwmJSkeeC4N7M7oGPw+T5ZToeec6JpT9a7
         12p9MGrzOfwwmf9dTgGfsFCKV1lNJAOfeaSsS0UITIbXzUtXewZUwsxv5RQ3/nLhDYpy
         M1g54hdzpzgsuQa4CX6tbEAEpkovAz+51yzI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794364250; x=1794969050;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t8BFlEAmJEj8HGxMKTsLsaY7aesl7fSNxoZ8biKmTbE=;
        b=zB9TpsplJkxR7PstnrQ7zoBuQ3CRxYlPmgMuldunskSeWHFmz73/d3UsFU6C69LLb4
         PFc/t35wj6HH2sh98eM5FvwzxuF/NL/nTMxaeY1lRqFuyp5hXBgFHeH9r/Xqw9FOGeXz
         fO6oG7MbF/lisKWYCYHzpHE2GSQpIlKfz+Z2zoExVj9sZud5MFsYzwARKqvP00P679Xf
         1l918mEgj17BR7m4KFXt6V7dgzUZ+JaoyMwcFTFl+chvOu39wlcnsfiuo4O8F8E5pT38
         p9Vhxw5rqgjNcOvFJaFnsHi/eJioHnNJewJLL1FriRvzmNXPerzQrIzsGBxamzd5Z2Nd
         gXCQ==
X-Gm-Message-State: APuU4Z8ru8mk0KfvmY3hm99R2oAk4/3kG90K9o0biN2UTFd/h0cneSvf
	Vyd31/OFh9HsjHng0zKDkT+C5cufzLukr1dB6ldByfgZ6n+kwhAdC0eGS2+uJwSJKnnuqxYZX1Y
	Xj1agq92ycn5KlcVfTg3+hWmQYjPtLgj3YKnHOzkZ
X-Gm-Gg: AYBFou1aifV3fLiViM4snKOrkDMfkYxZVGN1Bi6qCmV8MZJy1sd3NzUrF+vuOzPzDMs
	sxckQzt9YNvEwf5Pjvg9Le5wxRf2eABNR1NjLZf5Sv4/fuMyI3P+6/FZspa4jrFiKFZGKp0t42g
	BAIdn5IHlCW+DjmaHJnWhreNVgmlExWtUh9jopTO17TQ/qP31LbTxeH8jb4oS6uhrofiIJiaanT
	L9En1t/uw1CEwXy+FeuQn9eQyF8ArFnanEvOATFLKiPXdr9VCK00FeSB1Tgg95eMXZZcrif6Ogj
	ywdIk4sU1qEFbv1XT6L6h8YRKXZPyDhN3GgyC9pHEl1rKAXIE8LUxxfAU5eisoC6oRciyfztXOI
	Xl6ywrL4Z1QU1WGmBMVtU7XrhOEX0lvRKlfi4v1d7pJ0D9lUtqcbpQ9id8MeYJ2krqLjP9AoX9j
	3k4DkKH5NtGAch
X-Received: by 2002:a05:690c:fd0:b0:8b0:cdf4:94a2 with SMTP id
 00721157ae682-8b3a81ab7e0mr7261967b3.84.1794364250231; Tue, 10 Nov 2026
 18:30:50 -0800 (PST)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261110-mt6397-irq-num-fix-v2-1-9d5853a00437@protonmail.ch>
In-Reply-To: <20261110-mt6397-irq-num-fix-v2-1-9d5853a00437@protonmail.ch>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 11 Nov 2026 11:30:39 +0900
X-Gm-Features: AclHuK9ModA0hBuzgJ5zuMaqQJM9UHprenTTXYDmDO2P6KUA8OGeZIXeF99lf3k
Message-ID: <CAGXv+5FgXESTgZ4hNyPP1Cdd4BfnV8dVTNpitKKpNAuWY-gYMQ@mail.gmail.com>
Subject: Re: [PATCH v2] mfd: mt6397: Use PMIC specific interrupt count for
 domain creation
To: Ben Grisdale <bengris32@protonmail.ch>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 7:51=E2=80=AFAM Ben Grisdale <bengris32@protonmail.=
ch> wrote:
>
> mt6397_irq_init() currently creates its IRQ domain with a fixed number
> of interrupts (MT6397_IRQ_NR). However, not every PMIC supported by this
> driver has the same number of interrupts as the MT6397. The MT6328 has
> 47 interrupts, so its interrupts above MT6397_IRQ_NR (32) are currently
> unusable.
>
> Correct this by passing the PMIC's actual interrupt count to
> irq_domain_create_linear() based on the chip ID. Define the missing
> interrupt count for MT6328, as the other supported PMICs already have
> it defined.
>
> Fixes: 6e31bb8d3a63 ("mfd: mt6397: Add initial support for MT6328")
> Signed-off-by: Ben Grisdale <bengris32@protonmail.ch>

Changes make sense to me, and it also seems to fix MT6332.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
