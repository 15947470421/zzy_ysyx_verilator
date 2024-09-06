// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtop.h for the primary calling header

#include "verilated.h"

#include "Vtop___024root.h"

void Vtop___024root___eval_act(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval_act\n"); );
}

VL_INLINE_OPT void Vtop___024root___nba_sequent__TOP__0(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___nba_sequent__TOP__0\n"); );
    // Init
    IData/*31:0*/ __Vdly__top__DOT__i_clock__DOT__clk_counter;
    __Vdly__top__DOT__i_clock__DOT__clk_counter = 0;
    CData/*0:0*/ __Vdly__top__DOT__clk_o;
    __Vdly__top__DOT__clk_o = 0;
    // Body
    __Vdly__top__DOT__i_clock__DOT__clk_counter = vlSelf->top__DOT__i_clock__DOT__clk_counter;
    __Vdly__top__DOT__clk_o = vlSelf->top__DOT__clk_o;
    if (vlSelf->rst) {
        __Vdly__top__DOT__i_clock__DOT__clk_counter = 0U;
        __Vdly__top__DOT__clk_o = 0U;
    } else if ((0x4c4b40U == vlSelf->top__DOT__i_clock__DOT__clk_counter)) {
        __Vdly__top__DOT__clk_o = (1U & (~ (IData)(vlSelf->top__DOT__clk_o)));
        __Vdly__top__DOT__i_clock__DOT__clk_counter = 0U;
    } else {
        __Vdly__top__DOT__i_clock__DOT__clk_counter 
            = ((IData)(1U) + vlSelf->top__DOT__i_clock__DOT__clk_counter);
    }
    vlSelf->top__DOT__i_clock__DOT__clk_counter = __Vdly__top__DOT__i_clock__DOT__clk_counter;
    vlSelf->top__DOT__clk_o = __Vdly__top__DOT__clk_o;
    vlSelf->clk_led = vlSelf->top__DOT__clk_o;
}

extern const VlUnpacked<CData/*7:0*/, 16> Vtop__ConstPool__TABLE_h1f93ebb4_0;

VL_INLINE_OPT void Vtop___024root___nba_sequent__TOP__1(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___nba_sequent__TOP__1\n"); );
    // Init
    CData/*3:0*/ __Vtableidx1;
    __Vtableidx1 = 0;
    CData/*3:0*/ __Vtableidx2;
    __Vtableidx2 = 0;
    // Body
    vlSelf->top__DOT__LFSR_to_seg = ((IData)(vlSelf->rst)
                                      ? 0U : ((IData)(vlSelf->din_en)
                                               ? (IData)(vlSelf->din)
                                               : ((0x80U 
                                                   & (VL_REDXOR_8(
                                                                  (0x1dU 
                                                                   & (IData)(vlSelf->top__DOT__LFSR_to_seg))) 
                                                      << 7U)) 
                                                  | (0x7fU 
                                                     & ((IData)(vlSelf->top__DOT__LFSR_to_seg) 
                                                        >> 1U)))));
    __Vtableidx1 = (0xfU & (IData)(vlSelf->top__DOT__LFSR_to_seg));
    vlSelf->seg0 = Vtop__ConstPool__TABLE_h1f93ebb4_0
        [__Vtableidx1];
    __Vtableidx2 = (0xfU & ((IData)(vlSelf->top__DOT__LFSR_to_seg) 
                            >> 4U));
    vlSelf->seg1 = Vtop__ConstPool__TABLE_h1f93ebb4_0
        [__Vtableidx2];
}

void Vtop___024root___eval_nba(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval_nba\n"); );
    // Body
    if (vlSelf->__VnbaTriggered.at(0U)) {
        Vtop___024root___nba_sequent__TOP__0(vlSelf);
    }
    if (vlSelf->__VnbaTriggered.at(1U)) {
        Vtop___024root___nba_sequent__TOP__1(vlSelf);
    }
}

void Vtop___024root___eval_triggers__act(Vtop___024root* vlSelf);
#ifdef VL_DEBUG
VL_ATTR_COLD void Vtop___024root___dump_triggers__act(Vtop___024root* vlSelf);
#endif  // VL_DEBUG
#ifdef VL_DEBUG
VL_ATTR_COLD void Vtop___024root___dump_triggers__nba(Vtop___024root* vlSelf);
#endif  // VL_DEBUG

void Vtop___024root___eval(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval\n"); );
    // Init
    VlTriggerVec<2> __VpreTriggered;
    IData/*31:0*/ __VnbaIterCount;
    CData/*0:0*/ __VnbaContinue;
    // Body
    __VnbaIterCount = 0U;
    __VnbaContinue = 1U;
    while (__VnbaContinue) {
        __VnbaContinue = 0U;
        vlSelf->__VnbaTriggered.clear();
        vlSelf->__VactIterCount = 0U;
        vlSelf->__VactContinue = 1U;
        while (vlSelf->__VactContinue) {
            vlSelf->__VactContinue = 0U;
            Vtop___024root___eval_triggers__act(vlSelf);
            if (vlSelf->__VactTriggered.any()) {
                vlSelf->__VactContinue = 1U;
                if (VL_UNLIKELY((0x64U < vlSelf->__VactIterCount))) {
#ifdef VL_DEBUG
                    Vtop___024root___dump_triggers__act(vlSelf);
#endif
                    VL_FATAL_MT("/home/zhaozhenyu/verilator/digital_circuit/ex6/vsrc/top.v", 1, "", "Active region did not converge.");
                }
                vlSelf->__VactIterCount = ((IData)(1U) 
                                           + vlSelf->__VactIterCount);
                __VpreTriggered.andNot(vlSelf->__VactTriggered, vlSelf->__VnbaTriggered);
                vlSelf->__VnbaTriggered.set(vlSelf->__VactTriggered);
                Vtop___024root___eval_act(vlSelf);
            }
        }
        if (vlSelf->__VnbaTriggered.any()) {
            __VnbaContinue = 1U;
            if (VL_UNLIKELY((0x64U < __VnbaIterCount))) {
#ifdef VL_DEBUG
                Vtop___024root___dump_triggers__nba(vlSelf);
#endif
                VL_FATAL_MT("/home/zhaozhenyu/verilator/digital_circuit/ex6/vsrc/top.v", 1, "", "NBA region did not converge.");
            }
            __VnbaIterCount = ((IData)(1U) + __VnbaIterCount);
            Vtop___024root___eval_nba(vlSelf);
        }
    }
}

#ifdef VL_DEBUG
void Vtop___024root___eval_debug_assertions(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((vlSelf->clk & 0xfeU))) {
        Verilated::overWidthError("clk");}
    if (VL_UNLIKELY((vlSelf->rst & 0xfeU))) {
        Verilated::overWidthError("rst");}
    if (VL_UNLIKELY((vlSelf->din_en & 0xfeU))) {
        Verilated::overWidthError("din_en");}
}
#endif  // VL_DEBUG
