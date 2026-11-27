Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795808505;
	b=Ahuk3bcNC/PARWHpBtJ1R55OQF/OBP5ya9IfC0hQ1h7j7S/gkVi8EfnzBAP6v2hTevap
	 ICEOJRPDfOoBxap448Kh6p+Sh6iq8z7X+s9jetF1y/dWEYpMF5qCPnHC7QPwAHmFtJhXC
	 iUDBgzAHdjED6LTunqiHTSvvLMvzQTBp94SIGC16f+JnQJ1c2PF/m/u400Lw+YFQymzkq
	 RL0N5BCAQS7YcynWYvp4QKjv9qDe6WtHFTHKJLdzIU/mSw+ZG+3BFDomy/wtlqgy2LVy9
	 n8BL5vbBY9+XN8ipmPEhB6vCWvWaObRFyOB/UwFvQQ0bkikZGMbp7WDM6Qf9Tu4xiCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795808505;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=6NlbtvLkK0tgXcaycQQR/bKkLqj97Yphah1S3Bta7cY=;
	b=iI42kHn8o20vbZ9aNdRNqmD0f5wBLg3NXqJimT46Guv0pKMMiGzLwKf/f+etHCLRSkfh
	 3TO92ZgfOemEyevr4CMkX05Epv1qdDRkorTA1u9pT63UGk25rakcyut8mw3ZSDaIo8E/G
	 C9zZJz/mZB2dS3O5/BYNmAPBIgbcSEvriFfLQOrpjt+44ItQvZIlytyF8u9VYZva9XJIe
	 GD4YBUoRQKTs70FYDvWpGGc1H+grf51ddAaWKNeKtS1+R4ZGHXEYFoLZamYYTTh2hVLS1
	 oSJ1/Ueu125n4EchYFpwJFiLowtNrZCy/cm0gUdtoPWaAmQg7UJKzea1gD3E6TE79Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wfHy3Lfl;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69103606A31E
	for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 19:41:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69103606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wfHy3Lfl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so86026105e9.2
        for <mfd@lists.linux.dev>; Fri, 27 Nov 2026 11:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795808504; x=1796413304; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6NlbtvLkK0tgXcaycQQR/bKkLqj97Yphah1S3Bta7cY=;
        b=wfHy3LflWfbA+3j2hUr129CB0u9fsmKnDLoZzLHNfgtIRF1krJlD4PHNKQEFxMYcFa
         Qa2iQFkAdxt5vCIUcRqzGaz1HyeO3/X42fELHv6ev4JdQ1hAQ+4oKFdQdECTpsnL3YlU
         SVKX+/To8oytAaE0sXGVG/aH7p2XIINJjkYoEloBi6KbKIS/EjgYyigFMo+p/T5/zpcg
         yYKt+0aQG5LZRFlGg5sQ5xj7BEzflFQKGeCc7zLN7YtVLNvRO4wY/AZ+xPbrJ2ikG7o/
         zGOJ0JuG4F+z8ucXFSIOW3wL9QaDasr2yJEq7V8zvYvekKdjb3d2fx/aWgkVnvyTBzsS
         1/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795808504; x=1796413304;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6NlbtvLkK0tgXcaycQQR/bKkLqj97Yphah1S3Bta7cY=;
        b=uCzWS7dz8+nHSJNatc2F7e0OwnIOtLMONFSXrqLrcapWvzVQXpFF3cNOkE4wBvXNyY
         HiVL5qw4NHGjCWFl4tGt2TPFE/dkqxhEXG+mS+QFtbY5m8njcAxqB/HYXTJU90TNcUf8
         ZucsryWxwwz4Kl7ww6T7v0Pl7gH0MY4fLWp/hqNlnrLuGujFeMzMj/8etoDqwQ1LuyRT
         JrY5IY9qu0r9sqvINDjckrY+qNhA86UQ3XrMbD2v61EbTeT2SszEXS+8g63yOkdpi/8C
         z1ObtuYHVGiwSC91qz9hEQCgqoiJ0N3ZhuTYyXRBfs8DjYYmRQFNce2RdWjsJJ1HptUh
         HCPg==
X-Gm-Message-State: APuU4Z9UJVxXV5aitBCA8XaObupav1k7JaIEZYv8KtNdco/43Q5CeILI
	1SejX5uXW/B3P/zg2Avgfr4YoJc4cYmQR+GQ5DInLlOJa7bU8j3Qu4aC805AfrNc7z3r7aygakL
	nECSWWgVNkg==
X-Gm-Gg: AZFdTZdFJpHOxJ59mDCdKbehkVUURdtmk6J8BNIgdVQTsKAtBS0iYtwFXuVUX/GbzUO
	1Cpu1cqHoPLn3duva5533W/AiDQDRtOoFoaNi099mAmenSfUYR7OCw6iOygiIQLKPx+9tRixW2q
	Ou8YYXGAcc7JZtJ+LXwjPOUHBWg3WcaZmv2WtTeMsS8ODLOqvDtrEMAl6PxPeghuuxQDR30x1/5
	zYgUAHWghDv/7tpOFrVXkZHkOiTGj1gBOdJCjqU2GYYvpQypZnctx4u6HJ1tJ4DXTkwxV8x8sEs
	nE+eC1Y7q9Rqvt6O5+n3sKvIxK8ovBRBhblKa7j15ciMCoS62aRv0lOyyRd3x6VnLZInOJUPbGc
	OTltEC7CV3L742sPnV1sJgKy7gJvMyCCuzdPYe7h+p/fxL7L5W1amV+we8ZSLt93NEpMsjqSLbB
	K+BKYc5EzvTAUQJRzP4IHMKHQsjyTlKm/1g8GKgDNQjPhJscZy7rxNBCr/9fECrvtPW4LGeoDKQ
	6PZfHlEAIYgFbd45/Q+NDBUVzSS9hgbCh775S3r+He1YOqwhvbSmRnZZ6iiaxmpB+0fIJMN6jER
	hiDvb2+2aFclaWG8ltYYSeFYd6uRtKa+Kg==
X-Received: by 2002:a05:600c:1d8c:b0:4a1:c5eb:b445 with SMTP id 5b1f17b1804b1-4bb88820436mr532823045e9.35.1795808503757;
        Fri, 27 Nov 2026 11:41:43 -0800 (PST)
Received: from draszik.lan ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bbb39dd4e7sm77524985e9.0.2026.11.27.11.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 11:41:43 -0800 (PST)
Message-ID: <d92561fd6eaea337c6bc3502bcd3df0bc30d0e60.camel@linaro.org>
Subject: Re: [PATCH 6/6] power: supply: max77759: follow the supplier from DT
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, lee@kernel.org
Date: Fri, 27 Nov 2026 19:42:00 +0000
In-Reply-To: <sashiko-outbox-238159@kernel.org>
References: <20261127-max77759-charger-fixes-v1-0-b364a0862d72@linaro.org>
	 <20261127-max77759-charger-fixes-v1-6-b364a0862d72@linaro.org>
	 <sashiko-outbox-238159@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9+build1 
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

Hi,

On Fri, 2026-11-27 at 19:30 +0000, sashiko-bot@kernel.org wrote:
>=20
>=20
>=20
> [Severity: Medium]
> Does calling max77759_charger_external_power_changed() directly from
> probe and from power_supply_external_power_changed() trigger a lockdep
> warning between chg->sync_lock and &psy->epc_sem?
>=20

[...]

> CPU0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CPU1
> ----=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ----
> lock(&chg->sync_lock)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 down_read(&psy->epc_sem=
)
> down_read(&psy->epc_sem)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lock(&chg->sync_lock)
>=20
> =C2=A0*** DEADLOCK ***
>=20
> CPU0: max77759_charger_probe() ->
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 max77759_charger_external_power_changed() =
->
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 power_supply_get_property_from_supplier() =
->
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 power_supply_get_property()
> CPU1: power_supply_changed_work() ->
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 power_supply_external_power_changed() ->
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 max77759_charger_external_power_changed()
>=20
> In addition, even without the unlocked call in probe, calling
> power_supply_get_property() on the supplier inside
> .external_power_changed nests down_read(&supplier_psy->epc_sem) inside
> down_read(&chg->psy->epc_sem), which lockdep rejects as recursive
> same-class locking because down_read() is not annotated with
> down_read_nested().

Both lockdep warnings are caused by the shared &psy->epc_sem lockdep
class in the unpatched base tree, not by a real deadlock: the two
semaphores belong to different power_supply instances (the charger
consumer and its supplier), so the actual lock order is acyclic:

  [chg->psy->epc_sem] -> chg->sync_lock -> supplier_psy->epc_sem

As noted in the cover letter, this patch depends on:

  power: supply: core: give each supply's epc_sem its own lockdep class
  https://lore.kernel.org/r/20261125-power-supply-epc-lockdep-key-v1-1-c8a4=
1b8a4470@gmail.com

With that prerequisite applied, consumer and supplier supplies have
separate lockdep classes for epc_sem and neither the AB-BA nor the
recursive-locking warning triggers (verified on Pixel 6 with
CONFIG_PROVE_LOCKING=3Dy across boot, supplier unload/reload, and
charger module reload).

Cheers,
Andre'
