Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793296635;
	b=bYY5Kl7aJbRbAFBJhbEDiKIhSeJtJZ9ZQtCsSbzXcuruSIbR2Df32Cf25o5Yy7FqnKii
	 KN5r+SjOwNTJMvIM2iQgmzc8wITS7QzKu5rxSGCiA73EVsWkJ2q1ibuTqO+oeRBa1CnYG
	 bicYtGy1rZ40wn5MxYFIc7sifqSxBjLx+rC/VrBtYs8yaTfP3vm65rIKCW8m9zOIPeP5C
	 IEsqyK1B/jxom7wBLxQdgRuNFFKYSlQgq+513cZCKnHaPxdgWj1bDFwEaq/stwIqowBwJ
	 r9TMbKe0Edf73fmWtNTk4cRCYa4DIWUK3QR05yIAlHdZz/iCH82+s2kI4f4nsm8YSQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793296635;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=nDX2rRdVV3QP/6Ts1rsElxSn3+3Z1o4ammOugDPSu3s=;
	b=g60S5uie69+64tni+4gWI8s312JFlYbfaHWJJn2VHl7MtNedgzJpybRvmi7peX/zdWe4
	 pN8d9G9wZRtfXD6Mit2iML5ZAa+QGjoUtTiCxdFR2M8w7SWH0/nDp3Yw7UhVEkfVSTopu
	 C7XmUeGgdHjZ42i17swn6DTXutjOLwkB80gzlKbn0jeXE0yOspKD4DgV++t0dMk0i4OY/
	 EKQui4xkuOmoCjjUTdhPVrsIdv5N/21Rt1mQr6nQRUM0yMluCZG0ETxUc1SbLxMZSXmwy
	 4iuqXzOQs6BTnIqC+i67fd77RKQUOjpMKS7tgLtLBLtH8Rvv3CAOhsx4fC+p5t3GjvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFB3606A31F
	for <mfd@lists.linux.dev>; Thu, 29 Oct 2026 17:57:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CFB3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so25006805e9.2
        for <mfd@lists.linux.dev>; Thu, 29 Oct 2026 10:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20260707.gappssmtp.com; s=20260707; t=1793296628; x=1793901428; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nDX2rRdVV3QP/6Ts1rsElxSn3+3Z1o4ammOugDPSu3s=;
        b=tZmT1vrXVXXCn+x73dwQQMH0xegKbHh9b5d7i1GJsYjtqDykPJMwkVkiiiHT0DDirv
         BQHfLUGcW7ERi+53EJTPKbVCOj6QFxmazO9kZSzDUzANUfBWl5BA6ZdpQnnVyVc7ogg8
         eIUOfHvh9vld6lszS24Z65ZClnF/OZi/DQXEi4zU8rHIBor7CW5qv7yq5NjXkvKXA994
         +Ox9bjf1nwsZFSMBWdwQhwwZWzneRYxyRXKFWhW7ZmBbg/Fdes+89u7jtSL+lurc6vxc
         Tvtne86IUTlViR0MtGPSWZA5nQozzMixJNkAA4RWe5dtQdVG1etIscw0n6EcQr2UjUMS
         cYrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793296628; x=1793901428;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nDX2rRdVV3QP/6Ts1rsElxSn3+3Z1o4ammOugDPSu3s=;
        b=BM68FOb28tTLjWsI1hhE+CzI09QZYz/g0TH5TK+GRd/AuE5FXskEY+AbbWRanAgM1j
         to/oejc12N93iMMs4I1uvGsTTsy4ZTR3hu1EDI40ohmzNnR4W/ofyV/X4gM0wxGLNota
         9xJV4ii+fJcGFg8HcTHgEOpRwm3ShsCSBe7lEt6GBVckq02H93U1VFJTjYc5NYcQvZPK
         1wAf8MkQCAwcEcGVpvOkHtv3obfsO0L61UiCgj5HYuyGNz1YYklu1wpdn8u2ewwcG2oj
         ncq57Ot8U90Yv8/8Tc5GH18yNemTNxQjOo0k2Begc+pdHcMj9yadaLceqtnptRtLRl/Y
         eXHw==
X-Forwarded-Encrypted: i=1; AKwUvBxMcCeuVDegQMjqQkWOOOTu1QcxG2EE3HnBBzfK3opc4lCjAfl2RtZnj9ELr5k/4F5cGA4=@lists.linux.dev
X-Gm-Message-State: AFq9FYLTCkl00YdazOLo6bWRn3lGEET9DqnzmKZzUoTWgJY3aqdLBMNB
	IcnGm7CzDcbuAY7XPLOfyYCMFepfwLY5JpGMpQglnC9imYDBaZaXdQeSHKtIkPyizUY=
X-Gm-Gg: AYBFou0IgzIcfY3/obdRzB2eoiGlsKg/RcnIWxpnTDtrm9+CKdDQRNr5KwvlfDnaYSF
	UppPwrPbCCJ13XWoOXfDU9zwsxJDYpFi9sj+DWi2quHpQ0KX1wT0SNaffjjqjrXgt5djG+XJxW6
	Eu9uBiTTdkeAmdAnmR83qBF55RDXLvb05+qthX1Kq3DaEvQwfEH59aVcpg9GPx512J58ubVoShZ
	7tN4xizs+nN7zGZXSMP9PshHIQH13/4c8nOREjPmuRS7tfrLD7dcJXo/MsGMGnJB3qlHrZW6mpZ
	zViXNYYaU8qP0tVUd9qcz4HcjT5RdF8sI/bMRPDGWu1ZKsJT0vmWfkNAqyrxO8MjGitlO3+/7d1
	2LJEems0n7J9hqyqAT66nzRlhyVaq5VYDd3si/yjDDyEYz3+Alunepq9x8P3CJjHe2W67TNh2xQ
	pZU7TXy8bzpCphIvtb61ooVdmfiwrudsnDcdopT/E+fjtJQU8WgKtKurCmMzuWko8+1p7yhCxR+
	EHAVTFRrdbCyq5XKM265hwZQ69ZH06pvAeW2F61fnQquuegMrhv/ADR0JF7Z/3VX2LgoRGqqnEX
	3HwFSW2rnHandIuFISE2s9CIGnIPN3AsVz6u7YaRhXbOMavibhORiH9UG+8yvhudxxzwLQEQ3br
	6xabiweUnjHOoOZUpJM9SZJYRTj5H4S0lTKoVUmUJtrWvxZ0N6iYe5UtQFMa6TwbJ1r+ADNMTJo
	ih6eiu20nTdQA6Vg==
X-Received: by 2002:a05:600d:16:b0:4a7:669c:c988 with SMTP id 5b1f17b1804b1-4a9672f7512mr121511495e9.23.1793296627848;
        Thu, 29 Oct 2026 10:57:07 -0700 (PDT)
Received: from aspen.lan (aztw-33-b2-v4wan-169864-cust3247.vm26.cable.virginm.net. [92.239.204.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa8213ead6sm80168055e9.14.2026.10.29.10.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 10:57:06 -0700 (PDT)
Date: Thu, 29 Oct 2026 17:57:04 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alex Elder <elder@riscstar.com>, robh@kernel.org, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com,
	krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org,
	andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
	kees@kernel.org, gustavoars@kernel.org, p.zabel@pengutronix.de,
	mohd.anwar@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	mfd@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: mfd: introduce the TC9564 config syscon
Message-ID: <auOI8LbZNWbNGJuN@aspen.lan>
References: <20260918165234.687224-1-elder@riscstar.com>
 <20260918165234.687224-2-elder@riscstar.com>
 <20260920-fiery-fanatic-manticore-6abf0a@quoll>
 <85b0e7de-e4a8-4e08-b801-a9664d366e1a@riscstar.com>
 <7e32063f-f1a4-4259-96c9-fcbdd25c7f2f@riscstar.com>
 <fbeac5ba-a28d-4d34-8d23-4946aef515ea@kernel.org>
 <4bb9c85e-f991-484e-861f-1940b8263890@riscstar.com>
 <e3c9087e-fea5-4ec6-852a-a0e0e33ce461@kernel.org>
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
In-Reply-To: <e3c9087e-fea5-4ec6-852a-a0e0e33ce461@kernel.org>

On Thu, Oct 29, 2026 at 02:54:35PM +0100, Krzysztof Kozlowski wrote:
> On 28/09/2026 16:52, Alex Elder wrote:
> > On 9/23/26 2:25 AM, Krzysztof Kozlowski wrote:
> > I believe the TC9564 *is* such a "complex" SoC.  And in any case,
> > anywhere pci-ep-bus is used, it implies that some chip internals
> > would be described using devicetree.
> >
> > Would incorporating the chip internals in a devicetree *overlay*
> > have any effect on your opinion on this?  I.e., the "main"
> > devicetree nodes would simply define the PCI device hierarchy,
> > but anything behind an endpoint would be described in an overlay.
> > This way, pci-ep-bus on a PCI endpoint just provides an external
> > interface onto which a very complex device could be "mounted"
> > (and described in an overlay).
> >
> > I'd like to continue to move ahead with upstreaming support for
> > this SoC, but to me it seems you have basic doubts about
> > pci-ep-bus and I'd like to get past that.
>
> Well, Rob might understand this better, so maybe review from him will
> solve these questions.

To aid whichever of the DT maintainers can help with review, I'd
like to offer a little more background on the "TC9564 is a complex
device" thread.

Hopefully it doesn't contradict what you've been discussing with Alex,
but it will perhaps give a different perspective.

My thoughts neatly divide into three parts:

1. The TC956x-series form a complex enough family of multi-function
   devices. We will need some way to describe it's structure (both
   external *and* internal).

2. There are multiple ways to describe a device's connectivity but
   devicetree is great for this job making it an excellent technical
   solution.

3. We have done sufficient thought experiments (and real-world
   experiments) to be confident that our solution is not in conflict
   with treating the QPS615 as a regular PCIe card.

Having offered the summary above because I now need to spend a lot of
words to back up the above. I'm afraid I have to go a long way past
the syscon bindings perimeter!

## Why I think the QPS615 is "complex"

I hope I don't have to rehash the multi-function part too much. The TC9564
included comms peripherals (UART, I2C, SPI, GPIO), some very common SoC-ish
management peripherals (reset, clock, interrupt controller), a Cortex-M3
controller (with access to pretty much everything) and some licensed
peripherals with well established devicetree bindings (2x Designware XGMAC).

It should be noted that TC9564 does also include a PCIe switch. However the
switch is *upstream* of the PCIe endpoint we use to control most of the other
TC9564 peripherals so you won't see it any any bindings that have come from
Alex and me.

Another factor that makes describing TC9564 complex is the presence or
absence of side channels that give the host SoC mechanisms to communicate with
the TC9564 without using PCIe.

 * On RB3gen2 there are host GPIOs that control TC9564 peripherals such as the
   ethernet phys (used for power control). Additionally there is an I2C side
   channel that is used to control the TC9564 GPIOs. This is needed
   to solve a chicken-and-egg problem related to the PCIe #PERST signals
   in the PCIe switch but also ends up being used to reset the ethernet phys.

 * On a real PCIe card there will be no side channels, which means the TC9564
   GPIO peripheral would suddenly become `status = "okay"` on the PCIe bus
   instead of the I2C bus (in this case we know that there is no
   chicken-and-egg... if there were then the card won't work electrically).

Thus, even with one part number, we already have some fairly significant
connectivity difference depending on the board design.

Finally, the TC956x is a family and we'd like to reuse as much as possible
across the part numbers that will come. Having a convenient way to
reuse common subsystems is is very valuable.

## Why devicetree is a great technical solution

Clearly we *could* rely on a big pile of what is essentially platform
bus code in the PCIe driver to describe the connectivity and familial
difference. Renaming it to auxiliary bus code doesn't stop the results
from feeling like fifteen-year old platform bus code.

For that reason we view devicetree as a better solution to model the
hardware. DT already has idiomatic ways to describe the connectivity of
the device.

Most of the non-discoverable baseboard <-> TC9564 connections are for the
MAC and using devicetree simplifies the binding there since we add only a
few essentials over the existing stmmac bindings (there are existing
stmmac PCIe cards but I believe many are for MACs with a smaller
feature set than TC9564 which makes things easier).

You are correct that for several other peripherals we only describe
internal connectivity. Ultimately we are copying prior art from the
Raspberry Pi RP1. RP1 is also a complex MFD that exposes its functions
in a similar way to what we propose for TC9564 (and on Raspberry Pi 5
is it soldered down just like it is on RB3gen2). FWIW I'd note that I
think the RP1 bindings describe peripherals with no external
connectivity.

So, it's not that the card can't come alive if we use open-coded C to
describe the connectivity. It can. We've been there and done it. Instead
the argument is that *not* using DT to describe TC956x family parts in
their various baseboards is a missed opportunity!

## Using TC9564 as a PCIe card

Currently our work only supports QPS615 soldered onto an RB3gen2 with all it's
sidebands. Here we settled on a static devicetree (no overlay) similar to
Raspberry Pi RP1. We tried overlays, the resulting DTs were fragmented and hard
to read. Ultimately we felt embedded developers would find working with a static
DT easier.

If you feel super strongly that the syscon bindings (which is what this
thread is about) should not appear in a static device tree, we maybe we
could discuss overlaying the discoverable-from-PID-VID parts as an
"embedded TC9564" overlay. Personally I really dislike this approach
because it's hard to read. Also it wouldn't actually impact the DT
bindings so perhaps isn't in scope yet anyway!

For real PCIe cards I definitely think DT overlay is the answer. Here
there are no sidebands meaning there will be no phandles linking the
overlay to the base DT (if there is one). That resolved the concerns
about readability of the overlay. If we actually had a PCIe card today
then I'm confident we'd be able to reuse almost all the driver work
Alex has posted so far and that we'd be able to run it on a system
using ACPI as its primary hardware model.

There are still some warts related to PCIe card identification but they are
unrelated to the DT bindings. TC9564 has a fixed VID/PID so, when there
is no static DT to help us, we must dynamically interrogate the card
from the pcie driver to discover what it actually is and figure out *which*
overlay to load. This is another reason I view devicetree as
an excellent technical solution. Having an easy way to describe each PCIe
card form its schematic is a great property to have.

In short, the TC9564 on a real removable PCIe card has been an
important thought experiment for me throughout this work. It's also
been a real experiment: we did implement dynamic overlay for RB3gen2
and have it working. The thing that moved us back to static DT
for this board was the sidebands and these don't exist for a real PCIe
card.

## That's all folks!

In short, for zany embedded designs with nasty (and mandatory) side
channels, we'd like to use the DT bindings we have proposed from static DT.
This should be comfortable and ergonomic for embedded developers who
are accustomed to slinging DTs around.

For sensible grown up designs that need to cooperate with both DT and
ACPI, we'd like to use DT overlay. This essentially makes the use of DT
an implementation detail that reduces maintenance by avoiding reinvention.



Daniel.
