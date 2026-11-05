Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793841346;
	b=tqzlhazmOaNZl9RfPJm+vG/WWvhDm0Ub8MB/juBoOUR2J/3O8/fcjB2v1Cia+M3y1XwF
	 J51KAr/qwEVqVYhManix0JHIr0DTQ+2m6G8eNPsJCYm5PQkWO2YJ1CdddpjbIu+U1SQNQ
	 cVBU6g8ZFOY8oHHRCahlg2za9++RRFWbm+DsLPragt0EMSyjtCDrhcBj3iA8cs5BDr/CI
	 hQ5hdg8lmsso7tLbKTt+fls/AT/niDu/PbrWlOB4xK0DSBJpR/L7ujL9kw0rCJl+Y46Kx
	 iDrgMULap/+7Tx4Ox6EwPmybTGmRh2GgEN1mqIbsz5Im6x24GVKbhqss/ltYGpOV3ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793841346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=hofK0JryGgKL/fZhmAQm61x9/fz9wA6S77HE9ruycGk=;
	b=y9VO0OeAjNJdEuMn2/2L9lsOOHnX802uUAzxy6zzECgAOnKpHoL7rbbp7UsZqH9E2OGJ
	 I6qBYE7shse05Uvp2Sll6PX3F8BMQFNcm3plW9iI4VXpsUj/T5nilJUA4avcUaLqqAnIA
	 xeP6aUr8PUP6jEy3LAQgyJEVpyAybiCEZUbXoDosYFxp1OaShzpWG2wzN9xT2GYsZCmxY
	 CXYwtVhaGszempjBlbpbZNIjgjFqvtGdJ3ZA8E3ZjakH64ufdXfIoJOB5ujv2w5a3Kzel
	 1Uhh9NAiRtwx02XssTVx9FiPCdjU18kb7TYYiZoDFaqRtX9NNZnhVVZTbe0DH3eLYFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xFyUs4es;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DA3606A326
	for <mfd@lists.linux.dev>; Thu,  5 Nov 2026 01:15:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99DA3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xFyUs4es
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-14394530ec6so1912896c88.1
        for <mfd@lists.linux.dev>; Wed, 04 Nov 2026 17:15:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793841345; x=1794446145; darn=lists.linux.dev;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hofK0JryGgKL/fZhmAQm61x9/fz9wA6S77HE9ruycGk=;
        b=xFyUs4esI/cCAdIVclZiPVNXiXV4dt/nZSIdIAg1UoatNP49Oy1tpbcxwyF5MmhKhk
         szXsFMMlLP7ZiELK6G9Nu69uIhn8HPQUMh5OusL6uXprWIbuPR90bQ6XcRhqePETW4hZ
         RXKX05wkNq5HJJQmWBSYH+omBggf7AheEmHSsUyeD6+6p5wPVuodyept47B+Cj/XHUvv
         yA4fp+Extad8L29B7u41qsXtAxjC5drQCTY4BS7ugi3K0sOeNe4kzmxSfoFGnIUbyJAK
         1OVasLLAXgW3O6WRWZ/KtOaQD7IvGjm96Y7aHidq6RcjujtjWIBInmGfymRpJbm71c0r
         Qo4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793841345; x=1794446145;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hofK0JryGgKL/fZhmAQm61x9/fz9wA6S77HE9ruycGk=;
        b=lo4RRSfCrbDai2WCqipM6+HO9uPbhCAS2Fw1fdeoNtuAiLheHJjQBVCiGZ7fwB8OH9
         /R1hHCBeZZj4j2v/L60VcJ3DZYiO0H1J1pvb190gNVeLwI65NpsNASgZroNKX1XCJ/y6
         uHx12awpm+7DugL7KTMQ2owVRdq6//l/84dcZB6ej1T32b7bfUrCY74TcbMWYbm+lX4M
         BUIZ3/2YZiVl3bs2DiVhLEvZTpHatM66pJI+XUDlIvo5usFJnKd93662qCuCp58BZCHo
         ZUfkKrhV15P/H8jVbYViFi2qA9PEzn5v589yZkhk7DDgghnipdUX+ZdC8ByioT2XQwa9
         akCw==
X-Forwarded-Encrypted: i=1; AKwUvBz0BSVx5vX9aPYjaJOJziDnrAZjxK8rwzsYqzk5hs2wP17mR6Sa9LXfvA6ScTcgKvqkBwM=@lists.linux.dev
X-Gm-Message-State: APuU4Z+ZrzsqLUkXtpC7oINYKJaBxZ51XnofAgF2eAXRJNKwbfJEt4Le
	qmz29YjoVzbo3VsgR6Fy4sJiQTDNarb0pzUUxKKvCv7XBxruWFX/IBjg
X-Gm-Gg: AYBFou3FnINCyzzl3JvwRo+APayrIRUloPtKh4LiZgyCF5AxR5i7sOA/sg+92zaECi4
	9ghqMHeOtvFnPjap/R+0Q2osvgcBdJA5vd7yltYf50HHgFMR8YlMLOLzJsjhWYghXdASoAYtQqe
	QsCaVNU/Qp6PKwvte60PkOYZPuu11OJEUqHEFpT1iEwc6T8pgVDcbPEPjGfFG1uuBVe/ymoyr7z
	30lL3gMgx9HEuyq2Bail6gHTKdi7FV8V002wbxRyvf6X9ExH8tcFC2/CaOhx5dBgJfnO4721iXr
	YqURBm2VrGhBc9nr1lPpBWjWJJUm+3OlmjBwakrlPCrmgBogH+GpjyBqoZB9rKZBVahCDvR9OsN
	LNoDZhP2y4/1PqOn15wPE5AwC2xqlKgE+tmhIG2i6cS/QqHgV1xo6y0xvcvWBqgF4sLkWLZB0Fj
	vCp1Zw3Vzt7kfhJ7fS5A/25UuG+BjpVfJ1w0CyFM06LM7RdW/2p5uRtNbx9K0gZjc5CeWGvf52P
	ziu8D40BpolgHPTLtr8qCE61qfRjL8G5hFwEO7XOGYLUrpiazmkHRW8XFVEI9BZ/qq8MiFYHkSs
	o9thQTFFkvB04yIJjIwXiUfQyL8kIYNqVatE9f1DpZwRDI/2fSSXVmy8ReNajhYEnHQLWg==
X-Received: by 2002:a05:7022:3c87:b0:1ad:4ef5:ffed with SMTP id a92af1059eb24-1aea05f4bcfmr18283181c88.38.1793841344539;
        Wed, 04 Nov 2026 17:15:44 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:c8f4:b7d9:252f:4483])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c283sm12146627c88.4.2026.11.04.17.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 17:15:43 -0800 (PST)
Date: Wed, 04 Nov 2026 17:15:42 -0800
Message-ID: <ad02069b0cdede7ae191e4a3df57f33a@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Russell King <linux@armlinux.org.uk>,
	Mark Brown <broonie@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Arnd Bergmann <arnd@arndb.de>,
	mfd@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] mfd: wm831x: Support software nodes for DCDC regulators
In-Reply-To: <20261104181429.GE1650678@google.com>
References: <20261024-samsung-kp-v4-0-e21253295e68@gmail.com> <20261024-samsung-kp-v4-1-e21253295e68@gmail.com> <20261104181429.GE1650678@google.com>
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
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Lee,

On Wed, Nov 04, 2026 at 06:14:29PM +0000, Lee Jones wrote:
> On Sat, 24 Oct 2026, Dmitry Torokhov wrote:
> > +static int wm831x_add_devices(struct wm831x *wm831x, int wm831x_num,
> > +			      const struct mfd_cell *cells, int num_cells)
> > +{
> > +	struct wm831x_pdata *pdata = &wm831x->pdata;
> > +	int i;
> > +
> > +	struct mfd_cell *local_cells __free(kfree) =
> > +		kmemdup_array(cells, num_cells, sizeof(*cells), GFP_KERNEL);
> > +	if (!local_cells)
> > +		return -ENOMEM;
> > +
> > +	for (i = 0; i < num_cells; i++) {
> > +		struct mfd_cell *cell = &local_cells[i];
> > +
> > +		if (strcmp(cell->name, "wm831x-buckv") == 0) {
> > +			int id = cell->id - 1;
> > +
> > +			if (id >= 0 && id < WM831X_MAX_DCDC)
> > +				cell->swnode = pdata->dcdc_swnodes[id];
> > +		}
> > +	}
>
> I can't begin to tell you how much I hate this.
>
> Why are we duplicating massive static const structs just to add a S/W
> node?  Is there no other way we can do this statically?

The software node itself is defined statically in the board file
(crag_dcdc1_swnode in arch/arm/mach-s3c/mach-crag6410.c in patch 2/4),
as it describes board-specific and PMIC-instance-specific wiring -
specifically the host SoC GPIO wired to the PMIC's DVS pin (GPK(0) on
Cragganmore 6410).

Because wm831x-core.c is a generic PMIC driver that can be instantiated
on different boards or even multiple times on the same board (for
example, Cragganmore 6410 has two WM831x PMIC instances, only one of
which has a DVS GPIO wired to DCDC1), the shared static mfd_cell arrays
in wm831x-core.c cannot point to a board's software node at compile
time.

Note that local_cells is annotated with __free(kfree), so the duplicate
array only lives for the duration of the mfd_add_devices() call (which
makes its own per-device copy of each mfd_cell anyway) and is freed
immediately before wm831x_add_devices() returns.

> Since pdata is being populated already, why not just pass that on to the
> consuming child device (the regulator)?

The regulator driver (wm831x_buckv_dvs_init() in
drivers/regulator/wm831x-dcdc.c) acquires the DVS GPIO using
devm_gpiod_get(&pdev->dev, "dvs", ...). When converting the board file
away from legacy gpiod_lookup_table to software nodes (to drop the
fragile MFD device name matching and fix the GPIO chip label lookup),
gpiolib resolves the "dvs-gpios" property against the consumer device's
fwnode (&pdev->dev), so the software node needs to be attached to the
wm831x-buckv platform device.

In v2 of this series I actually tried passing the software_node pointer
through wm831x_buckv_pdata and attaching it to &pdev->dev inside the
regulator driver's probe() [1]. However, attaching a software node to
an already-registered platform device inside probe() is awkward and
requires manual teardown in the child driver, whereas mfd-core already
has built-in support for cell->swnode in mfd_add_device() (attaching
the node via device_add_software_node() before platform_device_add(),
and cleaning it up via device_remove_software_node() on error or
removal). Populating cell->swnode lets mfd-core manage the software
node lifecycle cleanly and keeps the regulator driver untouched.

If you prefer not to kmemdup the full cell table, another option would
be to split the buckv cells out of the main wm831x cell arrays and
register them via a separate mfd_add_devices() call, though that seemed
more intrusive across wm8310/wm8311/wm8312/wm8320. Please let me know
what you would prefer here.

[1] https://lore.kernel.org/all/20260708-samsung-kp-v2-7-3c6ed4c9b3b6@gmail.com/

Thanks.

-- 
Dmitry
