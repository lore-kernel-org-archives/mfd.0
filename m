Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B37C54EEBA
	for <mfd@lists.linux.dev>; Tue,  8 Sep 2026 13:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788874832; cv=none; b=b806oOfQChkzYUjhCxJRzMA8RJauNfEISriTr7k+xBjQTGkzrV3lY0vfYHNG2jmQEGHvr1+GQKB27tqwTjK9/btTlQEj/mkIR8asIikKs3USJLIHPKSmQ1fr7s5MtqqH3RTXV/IscBlSEJx6Q7S1q9sJ9GOWh6b50hQctakZqf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788874832; c=relaxed/simple;
	bh=gkZiwD1bUMbHLsoBAAMAF82T6b0KqXCHjaMB8sqpczs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NKUruzW170TQfb+/HoSvIJmi5N9mMXkZLTmJGJCMyhXm1gVFWvz1FqatVlz6rnM7yVFQwrlBkoyoKrJl4G9V885aN1ZCw9Y7LGUT+exMxIH9iQ3zCOlPoYYW/kpUglyDwbPS8LazZQXvq5ks56kqGlkVYto6wJQiWRKx4X3nq08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UxfGHMFi; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UxfGHMFi"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ce364488dso4089255e9.0
        for <mfd@lists.linux.dev>; Tue, 08 Sep 2026 06:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788874823; x=1789479623; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SJkr96/2clFb+b5z9ffMnNCNrpjtiTK03D1PubpYdyQ=;
        b=UxfGHMFivEST5KsC+jk1HMMAy6/V9iMmc/yaHe8wJqOhYXaNWs4hzFt8/x4vqhifba
         iK9mMVepsfH7E+IhVCTuY1423MKh+R+3akinUTbX/0nLxoEYFVF5GwupdU4fXYiKPxrs
         /KrWDBRGATtMkFvOm55VijnWG61Xu2AldT67ZC8Sg1RkwsK7qcjudxwxnibNHQ47jhZa
         AUGY5ZWsmU7d8wIXYo40BBDCNJmzGkpi9SYoF3t6qfM8uDWPoTyyQ5Tu6ZkT1cpcKXQO
         jVzlsghqpy0RnvvmrvYAfiLdNV4OhLHAEmsBtvn+mSsiu0qnz+GlfTmIkOhROXTmSayn
         kCZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788874823; x=1789479623;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SJkr96/2clFb+b5z9ffMnNCNrpjtiTK03D1PubpYdyQ=;
        b=BaG4oOmW+g23thWePEdbOx6vcnTxPgkCJlLPkw4fsP6fAEKBPYNmSLgKf7XXpXHjoo
         QoEzi9mw5JJWoJcgG8R3+Rjm+TXrdqHrrpmuQRvKVQF2aT1ZGcqiyzulV/H3yZIlidvF
         H/2ACpaERC78Yw+d7P+Iq2f9Nb8B9BY/u/5ZRJdimhycwPD7WOgiBycUasDiuEv+R8zZ
         ljUc/fP4TppInHEU35NUHnnt/xA6NoH+k9qu8toyLCO0MWSJpY2x0m9ux5uGw1FE3w5o
         2AjdGM+o0x715PlIcILlXtvlfSQ5ULx20KlaCVFNW3Uxt1mE82qXd20DZoEmKzNg7/pw
         MgIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwvSBqn1HqdEopSCsQmOG0bTJpXUURXOp80nh2DctuBctikIwOIrn2L1V2DWsU1q9hNlbI=@lists.linux.dev
X-Gm-Message-State: AFuF++n/OweN6i5sI5W14XG1AeT/yXNsM5bfRxG8iMs+syJd+HlDj3SF
	fGBEPBxBP41efezZitt47ZWyvg3H4/IUOvLJ2byZ9VIghROoniMeTppUwWGAhWpTXHJlJA==
X-Gm-Gg: AYBFou1HdBurdKzVO6kAQTtmOwpzIURvI1R+pzFZidl6PwVy0G/ZLCB+0+AlXrDhS7G
	4V4VXFHcNIooIhVa7Ae14k3PCxe4h3VT191jSOpKxKxI2St+S/VmrYXGDmDUq27X4ShbHJv89iQ
	KYVI1w1CyLkDc7Ppnk7kFsyrS/RXvaxAA/D45FmlXRQ3p+CmPPUBLIWi5xzHpuaSp7xnHXnNEIt
	mONlBBV0GhBZiUtUjz0nfZI6cKxEcnQSp47nLxQjXHYQgn54YP5tLBmS2CagcMf1BehuL+Uo26p
	49999bQHQk4EBqReiSBdxG4TUFLkYiOmZsV6VDf8SFnlpSegB6Ksy1DoA8OhOGp2Sm7HQNwtgFF
	4DjZjJeLfsFiyh4nTWywo95r6pvJG8c7hNHXUDgfLJP/VbxA/uQrnPX+TvyASUA1jgQfk1Xdkbk
	IrpguLbaVjt1/KQ2YIpS+5Zmg1B+9cQ0RVZGlWi0b64Zv7hhKE+3YvTtwU37sVw1M08MjDUKJ5g
	2Utp6yroMCerfIGVO/MQSRqjazqbFYp
X-Received: by 2002:a05:600c:c4b8:b0:49b:8f5e:51fb with SMTP id 5b1f17b1804b1-49d17543be5mr77030865e9.3.1788874822663;
        Tue, 08 Sep 2026 06:40:22 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49cfbe5b252sm345600325e9.3.2026.09.08.06.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:40:22 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guru Das Srinagesh <linux@gurudas.dev>
Cc: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	mfd@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] mfd: qcom-pm8008: support PMICs with no interrupt line
Date: Tue,  8 Sep 2026 15:40:11 +0200
Message-ID: <178887481187.4612.2819576206036967152@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908130745.2545-1-okerixx@gmail.com>
References: <20260908130745.2545-1-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please drop this series.

It duplicates, as a strict subset, work that was already on the list a day
before I posted:

  [v2,3/6] dt-bindings: mfd: pm8008: Add PM8010 I2C support
  [v2,5/6] mfd: qcom-pm8008: Add support for PM8010 PMIC
  https://lore.kernel.org/all/20260907-glymur_camss-v2-0-75f7982dc983@oss.qualcomm.com/

Nihal's 3/6 relaxes the same required: entries mine does and more, and adds
the qcom,pm8010-i2c compatible; his 5/6 already carries the no-interrupt
path my 2/2 was adding:

  static const struct mfd_cell pm8008_no_irq_cells[] = {
          MFD_CELL_NAME("pm8008-regulator"),
  };

on top of a PM8010 IRQ chip, match data and a pm8010-regulator cell. There
is nothing in my series that his does not do better. My apologies for the
noise - I should have searched the list before posting.

Nihal, if it is useful: the Lenovo Yoga Slim 7x Gen 11 (glymur, DMI 83QR)
has a PM8010 whose INT pin is genuinely not routed on the board, so it
exercises your no-IRQ path rather than being a DT omission. I have been
running an equivalent no-IRQ path there since 2026-08-25 - the LDOs
register and the OV08X40 works - and I am happy to test your series on it
and send a Tested-by once I have actually run it.

Your 6/6 also shows that describing a PM8010 as "qcom,pm8008", which is
what I do today, silently programs the wrong voltage ranges. On that board
the sensor takes dovdd from ldo4 at 1.8 V, and:

  pm8008_pldo_ranges    1504000 + 8000 * n   ->  1.8 V is selector 37
  pm8010_pldo_lv_ranges 1800000 + 200000 * n ->  1.8 V is selector 0

so the same regulator-min/max-microvolt lands on a completely different
register value depending on which compatible the node carries. ldo3 and
ldo6 have the same split. ldo2 and ldo7 happen to map identically because
the nldo and pldo ranges share a base and step and differ only in their
upper bound.

The camera works on my board today despite this, which I would treat as
luck rather than evidence that it is harmless. It does mean your series
fixes a latent bug for boards already describing a PM8010 as qcom,pm8008,
not merely adding a new compatible - worth a line in 6/6 if you respin,
since those boards need the DT change and the driver change together.
