Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795165906;
	b=gE12wt+iD7YGNLKztC4jlNkFFaV8YWYYiMu/VlTv43bNdM9ANZEOPTvEJC0TXzVPDJKa
	 EcgUS38oc303VyvzblDBzVAhVgtnxZPjmkxI89HoAwn38dWRdc1E5Jg75gAA+Ox9JBXZs
	 1Ra7nnxu6djzBA4NqkAQKs5KeChP2UZcrMQSUwA01xmXMLhGjoOzS3mlHgNN5za66hG+z
	 QtmY2fpMd0c2zpSZ4/OJAFtfGsIrDb6yEcqd7OiezNNNiQm0KXxdXqzQloQKumg2adjSs
	 IcrAOIcAxUqbmdm3eI2HtrQ62Gfh/rSeoVy7Qm1JW2+eur1JlRFtCmYK+qP42SAyM+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795165906;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=gApvMPkXNFvtfKmjlnFC4/zpO78lpC90tfwmIXaql00=;
	b=f0vcOTwGbIszAKk6vQvFd9AXit+B/KZH+Q/6S7RWaLxKKPoFnF1PxuoOZcEwRa1so345
	 Cr0Y/ZDL3an7XaUVPazWf71G+uONj1UrGINi4Fi71476p2QvS6eheM03VMv0wc2luwUvx
	 xhdhsHwqdAwHduNm2hsSiDbNqwDt1QM20GBFeoV1k7HzST6wcJM08Vi0xnKm+P/K5eBo7
	 PLccP9a9XDQHIgGsxzUPINw2eouls2U+NT75TEGigiPXdy33v2GlQ4q0xUAU0dDbeJeQ6
	 HEPOUo/pgkE0SJcrOUSxRc36LQo5vgjyWMx0Bslp6mZClX/C+zbTPVZciyGGV4pPesA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dbalint.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZcLZsZmx;
	arc=none smtp.remote-ip=209.85.167.72
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FD8606A32A
	for <mfd@lists.linux.dev>; Fri, 20 Nov 2026 09:11:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94FD8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dbalint.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ZcLZsZmx
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-5c1ab3fe822so245606e87.1
        for <mfd@lists.linux.dev>; Fri, 20 Nov 2026 01:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795165905; x=1795770705; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gApvMPkXNFvtfKmjlnFC4/zpO78lpC90tfwmIXaql00=;
        b=ZcLZsZmxiXwM2dmaHilYHfzhUoFN1uzk+rc2vkI96x+8iAScROPHTBIL6mKHpRZqc8
         Q8DB5Nu6RWh/8zkJKwt+BPW89eYnon/MwCnn2gL+rQUbmMWpNLTRf2hrnGy24rOIhRbo
         oDWTm3LEDW1chuKxKz8J0cO8UQ91J+ZA3Vrf0lmKuipDPyVtteSLOZC0v+EBxUQGFbEG
         8h2EPkwo/e9e+782b+y+2x+lfABTI+ObD0dkTlBtTUyjjbpgWUWcQHl99RRgVhfLGqyn
         tATmsMuEmp48LbugGITxMtz+lNB7ApQLlG8R68Ns0QBdrqrOTXqFYGP+o7cgae7gOiNy
         lj+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795165905; x=1795770705;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gApvMPkXNFvtfKmjlnFC4/zpO78lpC90tfwmIXaql00=;
        b=X23EB5VV2lGNWmhsqzCNZyTo7QMbicSN9WtfeRn4k2bXEua5DYTdEKPJkLN3o/wR8n
         95Oxt4g/CPew8c1CG00e08xZsZWkpQum9azk7WB8mF6l6WkUmhdG8EOtzY/lnjCde3C8
         KWfujJaIw82aOaoay6hnV1l0Ui08vSuePGlx2nD0ZnXvwHgshscRViXD+tpcquhbFsnq
         N0YQRCOiHy+K4dLUuPtm6h+vLIDJoxf/ibv2C7KWyrVSjvFta6nMfK7k5stRWacYnnxq
         GdK6BQ1kRkvsWz/XPXnrx+75ctiv3cpSDOh1lqBpYO81cbpxQK3omFrBNo/fx7AlJKYQ
         pa4A==
X-Forwarded-Encrypted: i=1; AL+hErETlQeIfZkSg5o093GriN3LFl3+IkEIWx1cmJca+tArekfC0hobLvvPicFetWhWXX+Qbqo=@lists.linux.dev
X-Gm-Message-State: APuU4Z+junA8UV1vPlZGGaJmhRZkZay3Zth1/0C26fMsRT1p/8aqO3SX
	6oFj6kEbKWFxal8VYCHehxSrp67YpiWdBnTQ2Z14R/OhkWjm9hHAn5CuWsRUv2CGp+/ePJmLt7o
	Z84Lk/Uzo1w==
X-Received: from lfbo17.prod.google.com ([2002:a05:6512:511:b0:5c1:a87c:20b3])
 (user=dbalint job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6512:3052:b0:5c1:5b06:27c0
 with SMTP id 2adb3069b0e04-5c1bc6f69dcmr588593e87.3.1795165904574; Fri, 20
 Nov 2026 01:11:44 -0800 (PST)
Date: Fri, 20 Nov 2026 09:10:22 +0000
In-Reply-To: <20261118220033.70425495@jic23-hlaptop>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261106193129.43493-1-dbalint@google.com> <20261107010356.39d9eddf@jic23-hlaptop>
 <20261118204532.257423-1-dbalint@google.com> <11a821f4-aef6-425a-8626-1d8641e9f83d@roeck-us.net>
 <20261118220033.70425495@jic23-hlaptop>
X-Mailer: git-send-email 2.56.1.750.gf70dc682cf-goog
Message-ID: <20261120091022.1459658-1-dbalint@google.com>
Subject: Re: [PATCH v1 0/3] Introduce cros_ec power monitoring
From: Daniel Balint <dbalint@google.com>
To: Jonathan Cameron <jic23@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Cc: Daniel Balint <dbalint@google.com>, linux-hwmon@vger.kernel.org, 
	Benson Leung <bleung@chromium.org>, Lee Jones <lee@kernel.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	linux-iio@vger.kernel.org, chrome-platform@lists.linux.dev, 
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org, mwojtas@google.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 18 Nov 2026 22:00:33 +0000
Jonathan Cameron <jic23@kernel.org> wrote:

> Do you need that coherent snapshot to get to userspace in one go? 
> 
> For accumulator channels the way they are normally done to sysfs
> style reads is to snapshot on each read, update an internal store
> of accumulation since enable then provide whichever one was requested.
> That way no data is lost - but you don't get an aligned snapshot.
> So it depends on what maths you are going to do with them, whether
> it can be done in kernel and if not how much interchannel skid
> matters.
> 
> So tell us more on why you need that coherent snapshot to userspace.

Sure, I can provide more context. Usecases are broad, but an example
would be that we calculate per-rail drain contributions over short 
time windows for comparative analysis between device states (device state 
transitions like screen on/off trigger snapshot), or for debugging and
power profiling purposes we correlate fine-grained ODPM data frames
(~1s intervals) with other timestamped system diagnostics in our tracing
tools (e.g. perform per-process-per-rail energy attribution), so math
happens server side, and the relative energy deltas between channels
within a frame are just as important to us as their absolute values.
In general, data from a single channel makes sense in the context of
other channels, there wouldn't be a client that requests only one
channel.

At higher userspace sampling frequencies, e.g. ~1s trigger intervals,
which can happen in both abovementioned cases, interchannel skid becomes
an issue if we read individually.
Because the latching and data delivery (up to 64 MKBP events)
roundtrip between EC and kernel takes non-trivial bus time that's in the
~10 ms range, latching per sysfs read across 64 files spreads channels
across a hundreds of ms long interval, which would compromise coherency
and render the data minimally useful. It would also make the EC
unnecessarily busy with redundant work, so latching per channel read
isn't really an option.
But to Guenter's point, this could be solved by driver-side caching.


On Wed, 18 Nov 2026 15:00:20 -0800
Guenter Roeck <linux@roeck-us.net> wrote:

> You could accomplish that the same way many hwmon drivers are doing it:
> Read all attributes in one go from the hardware, then cache it for a period
> of time.

I should have mentioned the importance of timekeeping earlier. As we're
correlating the snapshots with other diagnostic time-series data,
userspace needs to know when accumulators were latched as accurately as
possible.
In contrast to IIO, in hwmon:
(1) There is no timestamp ABI to propagate latch times, so userspace has
    to rely on its own timestamp when initiating a read.
(2) There is no trigger ABI to force a fresh latch on demand (e.g. on a
    device state transition), so a userspace timestamp only marks the
    start of a sysfs read sweep rather than the actual hardware latch.

So, unless I missed something, with a timeout-based cache in hwmon, a
reader has no visibility into whether it's hitting newly latched or
cached data or when the cache was actually latched (skewing time-series
alignment) or whether the cache has expired mid-sweep across 64 sysfs
reads.

We could probably tune a short enough cache timeout where time skew
would be negligible and mid-sweep expiries would still be infrequent,
then it's a trade-off between accuracy and more mid-sweep expirations
(more EC roundtrips). It could work, although we still would do 64
sysfs reads instead of 1 on each trigger.
So I guess it's not a must to send the coherent snapshot in one go, and
I cannot provide any data to claim that hwmon would be a suboptimal
solution to IIO, but our technical judgement is that IIO's explicit
trigger, latch timestamp and single buffer read is a cleaner fit for
power monitoring via the ChromeOS EC.
