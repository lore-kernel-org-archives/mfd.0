Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795400910;
	b=vFqnmjTX/9G0ntZ2Nj929WZsauTtnFE9Y3Fi5WdGOQMFZ0x9VN1igkUiob7SH7m7yAcy
	 xEShGSkFlx3n6qf2kUideVtvKMHNQXMDEByrrdWSoRuGiDZw+YGHYISBWkK0g8TZTzG17
	 uctXNH8uRGOCUYfVmQeo0aTiQy0J4IfQY1sXZgsy9MRqX+jqm6yVAiHhDR9RNC0hF0jMb
	 wBVIOTEPqI/BbKM1MoOS08JKPWr8y9UoJdsTrUQAZWHKxJmnhX1tliR8Qlq6HaNzXOU+a
	 rbT+LUgzVAApa0WDdeUHns58cVz0b7/TVQHBNjKcTWqOMni0KXFyMB/XBB2ry7N0/Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795400910;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Sl/jKCVgSD32LaFfQfoKkqKt/VZL+Shvp0SZIGxaeZI=;
	b=MgNStgaWUarYUMdorAfw3Dq0UHei80eRdkvyhgPvWf+h7t9oSign2gtSiEUJK/yOV3Jm
	 wckg5+T+f+bjqztPhBQJyuXF5bu/vDYG+7ambozXrxAEsgYgmzihUcH99SurGOKoTH3sH
	 zK7d/dE2kw6gHqxIx2z78U9GUN+wLrIcO89gSqDxtOiLe1nLoqw7Tp/045MtGcQxMraVU
	 ssrIyhsx7sLfWzGNJvEXfp/tk7bzyJCgG5y7PX7FJx5fFGI1Jry2atIS79LyZ/tiV70n+
	 RhJV5gKh4/3I+9HgJ436qScr8is+JDvvO6lLo3bn3f1AEsOg1LfOfKGIJ8yVCNdNp3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J+xRLYhf;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF16E606A320
	for <mfd@lists.linux.dev>; Mon, 23 Nov 2026 02:28:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF16E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J+xRLYhf
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3282db206d3so8532818eec.0
        for <mfd@lists.linux.dev>; Sun, 22 Nov 2026 18:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795400909; x=1796005709; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Sl/jKCVgSD32LaFfQfoKkqKt/VZL+Shvp0SZIGxaeZI=;
        b=J+xRLYhfwTkdhCX5I6bsUAa8uKgbDFRb7GW3zwcCVVXPPa+Sxqmh5u+mAYm0CYPRl5
         euQjufwaV86D3MC+q92niehTAID9Zs4nA0bGdCip/0V7v6et0pB0SqDwg55QGYzHQf9o
         /vBm547lHYDrsofgrNBkqydXgecb8PxeE1VLH9njgKg0nZs0Qxd8zLnMzskppesegm4Z
         TMwe64QLaVrxE/Wqfekq029v/O3Kd6C8fo86elhfm+CeqaM61lblZFPHFlaltQ2MhO//
         VTKpN68koy32h4j/TT4Pet8gbPjLzD4cRhAHcYX8QDdaGQXH4T7Ns6vyoWUej97H8B3L
         KKgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795400909; x=1796005709;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sl/jKCVgSD32LaFfQfoKkqKt/VZL+Shvp0SZIGxaeZI=;
        b=YQ0EdcNCmqJwlNndtJbi4U3fJM0iahmeYhY2M85o3lhUORqmZYENKKQw7PpAklVxwc
         Q3AkE7Ca2vxhDpw7vHHrs0dccthsSzLT46V9lJpctxO0whCI4rFoblXDRDdcvjW4ngB3
         t/eb1U2CsMQuyvYFQxTVXx2xf/O1ATRtq6SDgOuSvLhUuR0qUwarifwE48i301znU2kc
         GOZv1V/Q+/eAGnEXW4TVAL3q8/3wRP5f9Dve8NdwCuDuoaMwAov/zUdKWgN1qLS+eSsl
         FWPE9EVirGFJRSRoDpe1xk6yFd/1Rc4y8B8+/WpEM3O87tM7Lh9LlLYIVTzTjBdCWott
         Iu8g==
X-Forwarded-Encrypted: i=1; AL+hErGAvXPz9CVojr8twDZKfXFYHcLQMK01zsC0fxlZb3+x5HmML7CO30D/uPXH8V0/EkioQEk=@lists.linux.dev
X-Gm-Message-State: APuU4Z+ThWa2UM1zr20f4XpJXUj3C6Rj/RxCgPEtTbTTtYYbRzDfZJbl
	ejeyOHURDsmUVFdi1prfyzdjzMPOU2CmG3v6ek3hZANLD1NFrj89uJ7P
X-Gm-Gg: AZFdTZfFoHjbq6dIztv8U+Tq173YXCwc1qHbh1t8xyeBij5yDZgEE+y3uqWwlG8be8L
	YepwZQb12hk5zwk4coBLfgEJ6OOWBPwvDnakz9uE6XHo5EqLpEU6ziGOXOc5gaEYebCrzvqtlik
	CuqkjBp3hRE+nLw1QTXAr+8Acir9RYZI8neNl95SPCRJY9dQ/xY/A189DoPsk0dqjW/YjxKMPW2
	Wy383h4sJGpTl6RxGQtwKt2LJvLXzslhikIO2AfEhZrU18Q/VDXUTBl32kiwyvGDGsVgcxkO4PM
	usth3fVyWTrFstl1mJIoA/bEmD2Z8pfLtgBsVb+mqFdaOsiGH0T+g30My91xiE8FTn8Pn3aZC66
	DP1Eph42gZINh5/dtFrb9lFDFqxTZvkwnY9u+G7lSelxjSaLmllp6LDY4ntE8M4Iusr2cjDe1xS
	so1+szgFe7rGMQ85v9Pj1d9TmWqkZoEsInzYdbdreYHD+eE1UaQ67u+MS3DHJasOqaQNJlmGwYI
	3/F5rKvUNFtNvsXSmy5NG9KoLOwmsb+uvFMxzys4S3gJgAVLAa35QELDpmewXBRWN8ypTkgpE3V
	Nrc7sgFomBVvb8Uj455dgPiFymulY82WTr2KlVnzrhVy9wdWqqjXrtSmlfCVlQbpoCPuAXs=
X-Received: by 2002:a05:7301:d805:b0:385:ce95:2e14 with SMTP id 5a478bee46e88-385ce953221mr9510209eec.30.1795400908908;
        Sun, 22 Nov 2026 18:28:28 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:f002:4621:aeeb:e0e7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm35337348eec.10.2026.11.22.18.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 18:28:28 -0800 (PST)
Date: Sun, 22 Nov 2026 18:28:25 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Geert Uytterhoeven <geert@kernel.org>
Cc: =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Svyatoslav Ryhel <clamor95@gmail.com>, Ion Agorria <ion@agorria.com>, Lee Jones <lee@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, mfd@lists.linux.dev, linux-input@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2 2/4] input: keyboard: Enable compile-testing for
 KEYBOARD_ASUS_TRANSFORMER_EC
Message-ID: <awOkxOB_owPvollr@google.com>
References: <cover.1795355432.git.geert+renesas@glider.be>
 <8b0c54dbf722168d9272a4bde9ed4618c19e8afb.1795355432.git.geert+renesas@glider.be>
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
Content-Disposition: inline
In-Reply-To: <8b0c54dbf722168d9272a4bde9ed4618c19e8afb.1795355432.git.geert+renesas@glider.be>

On Sun, Nov 22, 2026 at 02:56:31PM +0100, Geert Uytterhoeven wrote:
> From: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> The Asus Transformer's Mobile Dock multimedia keys driver builds fine
> when MFD_ASUS_TRANSFORMER_EC is not enabled.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied, thank you.

-- 
Dmitry
