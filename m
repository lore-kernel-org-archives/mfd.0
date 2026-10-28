Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793160928;
	b=4F3hPWHFRunOlVF1DcNR+yUQL7Kq768a+u2p+nFEQI19kPCuoILexBv0zjKQvUC2ZVoe
	 cpknUiigH6li8sWLuFk0k3LtmKdoL6s3s6XrQcBrgqI7es16ahkYIU1HO+0TpF5usazUM
	 s6EmjvPbT0QaoDaQz35gbHZOJ3UwqD+YCsrYf0iRyozZqKat4WdYUc3Bbuoc98xak4Wgf
	 ESvQoiOrdRXste37nEI+GkpXqWqbGs6DSsu9soptibckC/+f9FAJYWbG6rQ6+DV4oeKow
	 64LDqS9nT50X9EaE9/2ns9UAEtzwjc4KKQ8RTATMs1wq1UIXXJhrUL6g7Pcb/0e3zbw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793160928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6dpWoYlTlEAfWqEEan0QByNtEFOBLeZmhb3FVQn0nhI=;
	b=0eTezcWH0EMKcK+fltjVYYAsTxhK5rt0wEGdU826z5qFrCapwb5DrsmcS0tkQQfbAmPR
	 TzzlsW6zXgDKiIwe0LjauBTSnMt6W0wvMTiJZTiHuiGJ01wQ4KoAaTEGDQco+B7eopkkO
	 /HRDJyeN3t1jZn2y/FXq9znD9Ru11hJkTCR5ZYhsR4MMQUJYZw0/gLxUdCy1DqiNLIAWC
	 CPc3oIn+qFPU/9T0hoqaS7zkxeeanDJR0yLxdxcMmvWLw4VxlSyAwLNC8kekOaP65iRr5
	 NNtNkN6Mv0LMenmoj2n4uNXV4qb0dx8s90btqdRTWdJ8/U5ggJcpB/JjdTAtLC/ZboA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=YdrLebnl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.49
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BD4606A31E
	for <mfd@lists.linux.dev>; Wed, 28 Oct 2026 04:15:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94BD4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=YdrLebnl
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-676804a3a22so539985d50.1
        for <mfd@lists.linux.dev>; Tue, 27 Oct 2026 21:15:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793160926; cv=none;
        d=google.com; s=arc-20260327;
        b=SEdRMvdcVVg2Ef81WN26yN/wpLsVngTCAC3CWDpDolX87VkJmNW13jSgIBOoskAwZZ
         sSXRhj9Cdf3Di3o3x9wT7o5F/baQs6VbFb86IR2CtlakZKk3l+R4RQ154IZkGQXEZyux
         Lpr1KWX/OfyGXq6sKf7SUi/DLhUlx8ZVrUh6K0ClFU00uqzJmi+JQMNqvXruuXr17di0
         I8l1yQh9BjRhEMlhzBkFISXcWVg6Itlv93INBHwCGqB8ie7oakc24krgINuRs/+CaXv+
         VcnKpdY4TG8M+ElQQK87ZYUUZTcoHY10J8JzB1RfvkzlC7Qu/DIndPz0EOyr3x6q/rc1
         YEJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6dpWoYlTlEAfWqEEan0QByNtEFOBLeZmhb3FVQn0nhI=;
        fh=y8ybPD39FxJ/UNv1JBGs7NE6oszPA0lCxkQrFcQ9k1I=;
        b=KPKnBRE7PAOppyVN7tzGCYNJR1Hfjz4pGVa9IPQSvMpHj8Yh0Uj5KRMGN5H/SUy4d7
         pU2g3gfw/dCHT0XJ72rP+E46rjutaSnKXP3WmvMln9QwNp4DEoF/A3L/uNaXLc1w8yQj
         brxWljb2SSw9Gv2Ug6Foo8cHvRXKvydbZxUfpRNEsqf0l2iBvf8cZa8+6yA8YTMYVAYu
         48TQP8YQu5+65id92NHORzulv21f4ai2aIoRX5EVwJ/TAqYO/RBp48VqJyLPT8xbl4SC
         6y4+KsK5Ls7x2fbpqRIzuyi55G/8DOJdH6EAAieCMenBnSCWmuxAUmSwQCM6znpcnx6Q
         /cSg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793160926; x=1793765726; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6dpWoYlTlEAfWqEEan0QByNtEFOBLeZmhb3FVQn0nhI=;
        b=YdrLebnlRBJ00xx32ikk9tpbi77NhyJbPNMMLA1UPUkL7NGwZ9FgakVJlvNGX1LSDg
         PDlHbG+L0/heBVDMxF6XcvM49Np5kL6FdHz3RybT1smHxwpXF6vGAGh2NGmXSQkioIER
         pDoURhuE/t2UfPRNkjYmrMyKJy2U0jYcwfR9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793160926; x=1793765726;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6dpWoYlTlEAfWqEEan0QByNtEFOBLeZmhb3FVQn0nhI=;
        b=EUdrkx9Q3YQYiSXTwiZdWb6jhB5OLPoACZ1V7hMSFvR0LymRqNt+T8D6JnzyfSq0tu
         eEP6dko9odPiqHh2QzIz7FzKuqq0/s3Pj6dSWt02xdx1oPm/fxSN1MKm8hBNUNan3zSP
         k/ohU86Y7JRjsUngVnq51lxImAQj4mzbOy5U9q9tqB34dktEJrwp5ugTG8beouRNyDVZ
         afsbZxW9RZ4JnhWILQPGJ2o92IBhFcDcQCIaiZK1fTWIirsAAbYequislNer/t7AFN4e
         /TuDDhFbgy5r671may1+INLoU7u2G11a9WzsMKbsINZSbhnIXopeuO2ft7RWrt7zR1eP
         RGUw==
X-Forwarded-Encrypted: i=1; AKwUvBw0tlkUkQ5vkmQGVU6Hsq7i9vGw4NotmjCDDjF7CQGD7UFIYoVo5uYZrSnvEI/nI74Y06Y=@lists.linux.dev
X-Gm-Message-State: AFq9FYLZnHZJ1oIt5W5ZE9S7NUzC3wf3KWFSKcb0ZVtwjIJcZxtgb+Ox
	9WDcjqcrO/Zca7oFbrIz4lj4eDn+QhfUIcel/Z/nHF6vcnjjCYhGaS0BTOnrV2y8KCxNoebqG6E
	oopsLuk18Pk6g78CwjH/Hfh2ptcaVGUrnFjZB+gaa
X-Gm-Gg: AYBFou3i7/36v3dvbkVJXCHG5+sAtv0jYRxCjE216AejiI1+nCL0CDkOOZRSNAZSY8T
	oGyIKui2X8t4Mt043nPQJifkhiTmUmXlwL95AubWN1Jn8koMKQqkmdZFSTJcghzVxsXWgmRGZcE
	oT4PaT0WHF/gWWPtyFJ/x33u8+g/UPrBC9wkCYchHnkUP6O3Q8dcglazobpxvBrHgE/yD8+wha6
	wHtrzK2cTxi/daU001LZFiApC/Aw70Gw03Ki97AQwFUfdQXeb7Ap5/p3DD/ixACKFQkl3HCoGVb
	JPZkruOuvGfADKP96k7Ylxy+LGlvqHQhQ71IOmtMKGrPu7K17A3ZgT2M2A9kkJv7s4NM/vZi5Ds
	8n3/YfX5gCtG1rg9iV0Vh14DbnrP5+uj4GCIX1wzGO6ngtV1kcYTwe9VIG+GZj5sYbKFqA4cpMU
	iIyYlqJGtBLuhs
X-Received: by 2002:a05:690e:2047:b0:679:5ae6:b290 with SMTP id
 956f58d0204a3-67a7b9a67d5mr1033094d50.3.1793160926582; Tue, 27 Oct 2026
 21:15:26 -0700 (PDT)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261027093306.2812695-1-lee@kernel.org> <20261027093306.2812695-26-lee@kernel.org>
In-Reply-To: <20261027093306.2812695-26-lee@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 28 Oct 2026 12:15:15 +0800
X-Gm-Features: AclHuK-igjxt6NXixiazz6taDDNXzzugHQY9dV8o_clIASacctwSUFB4CoYNooQ
Message-ID: <CAGXv+5F1WthGsE0zFqThBge=quNQ+8_LTtH4Shsh1dpdvGHV2A@mail.gmail.com>
Subject: Re: [PATCH v2 25/27] mfd: mt6397: Unregister PM notifier on probe
 failure and unbind
To: Lee Jones <lee@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 6:38=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> mt6397_irq_init() registers a power management notifier block embedded
> in the devres-managed struct mt6397_chip via register_pm_notifier(),
> but never unregisters it if mt6397_probe() later fails or when the
> driver is unbound.  Once devres frees struct mt6397_chip, the dangling
> notifier block corrupts the global PM notifier chain and causes a
> use-after-free on subsequent suspend or resume transitions.
>
> Check the return value of register_pm_notifier() and register a devres
> action to unregister the PM notifier on probe failure or device unbind.
>
> Fixes: 4e2e7cfec13a ("mfd: mt6397: Modify suspend/resume behavior")
> Closes: https://sashiko.dev/#/bug/linux-edb62fbc-213a-49a2-be55-c002e234e=
554
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Though in practice, if one hits this then they have bigger problems.
