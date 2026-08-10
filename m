Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87247443AA3
	for <mfd@lists.linux.dev>; Mon, 10 Aug 2026 21:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786399190; cv=none; b=REhwmXObGCbQm1sBPtkr0YB6/aZYtfMr0cnjTsREco/+UM8jSS+ALXJycWHWyLzGv+1s204TMfqZ1Fu7bThS9/z3X9+KzByKt5pxhfSjtPjc2JCUN/iJ80Ohz+iv4QGcHWARczCwaYooNwahiAlFNlLVmsFjp36Zj9q/pW6pZwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786399190; c=relaxed/simple;
	bh=WGRaFchSac3g+d7dCJ6oKbRm7IjQJlD16qXgPvpuuT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=j9Qmb78KiNtTS7WMfZ6PWZpbzldYrxpmbGCV7yz3hUGG7CaAAA5FtK7RLyUqN192Ka4A8l5AYcJgF+b2Fyr+T3P3VKNsUN+8Gl1oVktvBsgT6sMtvmAN3T81HYkljO9PuIAt6am/TXoZOBaYomBVAIrC0qkubydyUlZnEmV8CMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U1p+zCHl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U1p+zCHl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786399187;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HM0jDu4T7yH1UL3y9Xop+wHBl7p45KQE498sSn5/W1w=;
	b=U1p+zCHl1rFr+xFlXyJAC383nIJvEa3z7+xiBKfIQwBH4ZKy2YX/p+6Mw1nxzkqChehfZp
	28d+tAkvZoJi/+MaZSNBQDDkzvyBC7Jz5sTuRRanQwb3KyNYZaScKjTXojh1DowHj1P10a
	OX6qS0twigo6ltPjl/fpfQXZRVzhYfo=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-470-rs8Pv07tMtywIQayHD1mcA-1; Mon, 10 Aug 2026 17:59:40 -0400
X-MC-Unique: rs8Pv07tMtywIQayHD1mcA-1
X-Mimecast-MFC-AGG-ID: rs8Pv07tMtywIQayHD1mcA_1786399180
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-80ee3cb097eso82056127b3.1
        for <mfd@lists.linux.dev>; Mon, 10 Aug 2026 14:59:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786399180; x=1787003980;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HM0jDu4T7yH1UL3y9Xop+wHBl7p45KQE498sSn5/W1w=;
        b=rrjWjuasxCRDt/eH/iNJsQDbEq4zEuEHCvwrdQ8PLDg6z4K9DAKs6H018+ECX7tj9j
         qKXAeFMjbGwen0OPidFNLQds0YM6C9JnIekrgQ/vajDYuNdqEW+hanmW5If9bD4s00XZ
         ugQarvZdOZUTgLqm2wnd94xF7CW2dWTRqQHok1V4uGeJOUYIYLAQ+zA7bGzV+ZzGm79i
         RiIW3M6yYnFGrpY6uFHWlABn1EbUs5/RQpvsdRKUfSPYJ0qBkH7D/puKMuqTVyuicyYE
         slmn6KKWNwMKdPvk9IKw5fbubDaSotBAxS8Swv44xT5bJHc62dkD6td08qpBbSJNYJdy
         hWvQ==
X-Forwarded-Encrypted: i=1; AHgh+RoMLpPCwDrmLO98VDj8i+sP1COXzi5AUQ3rSM/HY1JRfiU/d48ybvjsdtwon89NG6JZMhU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwgiNgozk8RGrg8ovoqm7otG+d+oVKrlIQPob/0g3ANtcgRjbGq
	58VnpUzPLQAt9NDwYxhsIMLAZ20PaCxOsbIsMbdEuOr1AaoTjsjXcYgqSj2hV+0yd4kr0pJk/ws
	oNhGcLATIjCjW/fNOnOV3OO+AjdtuRJrWmlIfrTST+RZ4hhgVO+C/Pw==
X-Gm-Gg: AR+sD12CbmKnyiHvzr/bZ5slu4Urp9/0eKheFfdr32z3tVxBKvk/rE43CM99RrQ8UhF
	tn0gsvuQ/vxmlrrOoMIHwe9tvda2DrPQkskaIBRgvwYHZPZA1WEkFrxzaEVQ5mB9E/tsIM9AW3j
	wg5exd0RGufd0x0ntCyCHhx4w/fp10t32MTONtLdvaFLlPZjHpAL1DthG/ANkWlbG6ycYNnynG1
	KQiEVDGBLVSKNSxwlWWl24TB9JOJWenU6/7vVcsR0i6JmaE8oLgNpqQjHlU3VT2hrvsN4VTYIv8
	W2b5fjI3THSuiT3007eFfPPoiQ921CLHjEWYrFfAwAvbNDRyAUt3zoJZP38k8rUGz44sqpqXtzT
	uRXqHceeQ0hZllZlW385BumIiaJwAkPc6QtY=
X-Received: by 2002:a05:690c:2506:b0:81e:eb11:6e5f with SMTP id 00721157ae682-820229c195cmr279357177b3.34.1786399180130;
        Mon, 10 Aug 2026 14:59:40 -0700 (PDT)
X-Received: by 2002:a05:690c:2506:b0:81e:eb11:6e5f with SMTP id 00721157ae682-820229c195cmr279356737b3.34.1786399179584;
        Mon, 10 Aug 2026 14:59:39 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-823efbf208esm64134367b3.10.2026.08.10.14.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 14:59:38 -0700 (PDT)
Date: Mon, 10 Aug 2026 17:59:36 -0400
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
Subject: Re: [PATCH v10 10/12] clk: zte: Introduce a driver for zx297520v3
 LSP clocks
Message-ID: <anpJyOYpFBe6ah0I@redhat.com>
References: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
 <20260810-zx29clk-v10-10-63846490712c@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260810-zx29clk-v10-10-63846490712c@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RrETBcDk-Eeotxit62DKuBpXabZ0FBv2P8PPpxEmjU4_1786399180
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Aug 10, 2026 at 12:28:29AM +0300, Stefan Dösinger wrote:
> "LSP" is ZTE's term for this part of the SoC, I suspect it stands for
> "low speed peripherals". The main UART is here, together with the flash
> controller and more surplus proprietary timers.
> 
> It also has one more I2C controller that supposedly connects to a
> battery charger, SPI for displays and I2S for analog telephones. The
> boards I have don't have any of these components though.
> 
> Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

