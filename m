Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793159130;
	b=xTNXgPcSxv80/mDUFDed68G85/5C6Q1KkCcwhZ7eNrp/Q3gR8YQLAnxVdx67xh6RMTsT
	 /bIxQdr2L8aLhycghGOoygKFBaXMPTnGdl8rMnGDKhY9mAfRhAPRh/dBM0gR1AzLgo73Y
	 3fXCGvOZ2EjTV473WLA/0yOTLNwfr6AAyhqneO4J0r195W8zK/lDbsxvfHV4kO8siOhva
	 2X70kD/gHA8kRSlHTG6NWyNjD3Zr6l5nfUvr5Vp9PeavuOa4s5t+gPweNiWz70h7voOTa
	 pGtjtdpWkxuioWzTvKOdVNeHRo4PmUSo9tJMjlUokPNYg+DRI/19kPnS1YQnWOWdB2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793159130;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pM7VE/CerBkoBPkh4V5PjX+Bg9INjgdsKmYYksDXboE=;
	b=OiyuZ65pqDDdDTQyBmID1MM9qt/HTNbAjxLwxPWkZkj4FGn2XCwkHZp8ooRcmgLHsY2N
	 bUNGscaoIfayrrwqZmaDVkGZdZbXkc62rue1LIqWLXcfLkwlKbGIRqHXoGNxPdTgSPXYr
	 gtK23b/TqoUFkYgI32v49KbAxAqSbNcCTfIb0ApWEhWOhEctuyfvDNVvWbEokQhWOR49Q
	 3DhohH3L7L7Do/9oLJ0Y7kkJEAN3YaMc6UtsA8TCLVdGJL5lW5aoMxPqis9ecUCfypkIC
	 jnXlai+OpscvSXcLB+wAO6tg9OrGWBxKQxgJpD9T6jSSgaFibkxKl5+/hDTb7ub2z0Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=gNXwFsyp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B726606A31D
	for <mfd@lists.linux.dev>; Wed, 28 Oct 2026 03:45:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B726606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=gNXwFsyp
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b0d91601bdso15126407b3.1
        for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 20:45:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793159128; cv=none;
        d=google.com; s=arc-20260327;
        b=YNSS6yfzKTWrYJpnaZlEnbZr3rbx3guP0kv8zDHcwXydmAUJTM6usexGKyQsydnSSl
         8IeyjHRMfjSXfahgcjr0ddHEJ8QZ8J9uGdtDQc5+H5ibObUyYt6uDdkDDc67l6Toobn7
         tPQTFRBZI4lUMFhZ0oZenGBecz33AsDrEEdnVteAE1e8bUlBuhgkehbwK1rikDLqodnd
         QxPeUV092duj6jrIAzIOf5A7vI5ShnsPF0Q6XHhzjH03YyB25M7JMUX5WoZj5Onl3i2D
         kbiO42DQqIUyHV6xVdGQsrA5GWRqdW30n7R2JLiqI0Tkyajic71lGG3EeBKAeFkAWwk7
         CCQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pM7VE/CerBkoBPkh4V5PjX+Bg9INjgdsKmYYksDXboE=;
        fh=9imc484UsSQNGpKocOwR92FKsEtQd4uOT3ZeAjynzEI=;
        b=Vwb2fN7MOV4K//d2pjdxMkoA1Z+KQGGP2jODTcouRwrN004dWXAzjilpH6+zUs4P6J
         Yz9ms010bw503rdlu+lVT/st8WpzLDYpvHX0rnCANZc4EGZp/eDjx+YCOlJHvFBgav0c
         wgdO6a01iq8dgP7VIqjPSBytLXetPhdmU5ofZcmepUgGdK48Vtf6YOj24mf1DCLe4J9S
         1I3owSjVbns2ETSUGpltav/+RsZsWmZjvM/o2El1cdhD+uzPz+Sjte/WlyK7CVaaj35S
         1w4S7kwEvh4K0oPUf+24v9j06AGjGcr5ASKKkwd3HohEh2fBKq8TMxMXQcEs2EL9Bmz+
         HYHg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793159128; x=1793763928; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pM7VE/CerBkoBPkh4V5PjX+Bg9INjgdsKmYYksDXboE=;
        b=gNXwFsypaRgUtaKc+Z9lKK8textiuRm2ET2/EEIgp8PP0pEBRG1JVuxis8uoEhzdmN
         HTxn20bHrUe1sFkd2GO9+zbCFt1uDzIGGOEup60ZAxJokJDoRWCYUumWF6uJ1Tj17GNY
         5V63k8ORoPT4wqt0j2Ik2dqUFra2fOh5jMaJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793159128; x=1793763928;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pM7VE/CerBkoBPkh4V5PjX+Bg9INjgdsKmYYksDXboE=;
        b=zRLgBBeVxqmHay0yjteg5t8ZYOO82GKGvESOOylD7Ic6aCEyeX+eAhtU/e92SNGAag
         wLvypbJKbZrxvs/DCrXPcr/StMfF5FW1r1/zNB83CdG9qZ3Ik2tCtNc9Vzsl7GePjRUm
         5fze6o447n8oPOUFYRJV2uY8SWCJAHivlQTO9txIyihLPzajR1pmh3AW6S3E7GXYqq6C
         QhWdW5IqD7U0nkFqdOWChz5Cm0H1pNE11iiFWd0x0KHyVjU0DezJpxIhkE3ys9jxsXu6
         XsEZORnxALMsgeh3pw3KIHOb0pkN9aatkgkDLFznDVGy3CRKxrT4BpPcp4oCR228r5FS
         3Q0g==
X-Forwarded-Encrypted: i=1; AKwUvBzKVAE/Ji91JQDV+3X70P+9P0W6GfRH2vCK84vRWWSbD3v9tGJGb6ka2o8LuSQT0oPrlHE=@lists.linux.dev
X-Gm-Message-State: AFq9FYIfgmqADL8tYqIHtMMj/Ozmo3l2IAZlL5wfOn0opcGW/zcpBiGa
	ce28jcp9XYgXVAPCTJ7aYbCaKqycRSe5qUdMNiclRz00HYTQzkFE7BWfwh+AJQZmzb8ptZtfiZk
	YLWTa/QiPBrstihJ6SyDIhht2/pwITIfrV35uzTZi
X-Gm-Gg: AYBFou0A5UzJ+Pqz54cjTercEJHFqjQjO9KK1vJ+40yLETVopGoIY5VkfysRguf81GE
	7JoHEaMLzDLFqzUqiXLZgflfNeYqFbEf3Z9RetjrxFAUlnqgX93RX97ZYCT4OQj4flLaRPD8U5Z
	MUGg6tTotpvP7ymRdvsXfwgWnEmOy0aRjGu4QSdX546JEswGLzz0HmbLoHeuqz7zvsorOP6Y4WG
	NP1D7xN2p3GA3zw3TzxJWec1NA2FVssi2sxQHf4S8r1tv8ccKwDQ4PW3269UOvqGxINq5CtuZwq
	YdEm9stsLQoaeya4G2FhZXeLpWKX9y/uPqM8fSMILccpatbu9Zb1NqX09od0X7DcP1mKPp+2yHZ
	2WDayHDcvzDjG+rCYbSWXbFsgEWE1OoSEIjIjg7ZTARgAylwlj4ejClkyyNHGkHSOwOk=
X-Received: by 2002:a05:690c:d86:b0:8b0:a5d3:71c1 with SMTP id
 00721157ae682-8b19caaac51mr35421007b3.37.1793159128558; Tue, 27 Oct 2026
 20:45:28 -0700 (PDT)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261027093306.2812695-1-lee@kernel.org> <20261027093306.2812695-25-lee@kernel.org>
In-Reply-To: <20261027093306.2812695-25-lee@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 28 Oct 2026 11:45:17 +0800
X-Gm-Features: AclHuK_qoKOPS0Bqly0_GwH5QpE5HmWgWi0Q-7IU47_qa8u_hGoz7lpTqegB0HI
Message-ID: <CAGXv+5FWZQ1zM=mZm22qcqU86QO2oXQs0wtnGn1H9TrdFvfW1A@mail.gmail.com>
Subject: Re: [PATCH v2 24/27] mfd: mt6397: Manage IRQ domain lifecycle with devres
To: Lee Jones <lee@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 6:38=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> mt6397_irq_init() and mt6358_irq_init() create chip->irq_domain with
> irq_domain_create_linear() before registering the parent interrupt via
> devm_request_threaded_irq().  If devm_mfd_add_devices() fails in
> mt6397_probe(), irq_domain_remove() is called before devres frees the
> threaded IRQ and without disposing child IRQ mappings, allowing an
> in-flight interrupt handler or late IRQ lookup to dereference the
> removed domain.  Conversely, when the driver is unbound, the IRQ
> mappings and domain are never removed at all.
>
> Register a devres action immediately after irq_domain_create_linear() to
> dispose all mapped hardware interrupts and remove chip->irq_domain so
> that the domain is torn down after child MFD devices and the managed IRQ
> handler have been released on both probe failure and unbind.
>
> Fixes: 6df8dd5c185b ("mfd: Add support for the MediaTek MT6397 PMIC")
> Closes: https://sashiko.dev/#/bug/linux-b296fbe4-6e83-40c0-91c7-2c31e8d22=
6d0
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
